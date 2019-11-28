#include "fwlib32.h"
#include "http.hpp"
#include <nlohmann/json.hpp>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <iostream>

using namespace std;
using json = nlohmann::json;

int main(){
	
	std::cout << "Initiaze" << std::endl;
	
	ODBSYS sysinfo;
	ODBPRO prgnum;
	ODBSEQ seqnum;
	long alarms = 0;
	
	json logActivities;
	
	while(true){
	    
	    std::cout << "Start aquisition" << std::endl;
	    
	    cnc_startupprocess(0, "teste.log");
	    
	    char data[200];
	    HTTP http;
	    http.getData("18.223.194.18","3000","/getMachines/IP",data);
	    
	    string s(data);
	    string ips[5];
	    
	    size_t pos = 0;
	    int ip_num = 0;
	    while( (pos = s.find(",")) != -1 ){
	        ips[ip_num] = s.substr(0,pos);
	        s.erase(0, pos + 1);
	        ip_num++;
	    }
	    
	    if(ip_num > 0){
	        for(int i=0; i<ip_num; i++){
	            if( (pos = ips[i].find("N")) != -1 ){
	                ips[i].erase(pos, pos+1);
	                
	                unsigned short temph = 0;
	                for(int j=0; j<5; j++){
	                    if(cnc_allclibhndl3(ips[i].c_str(),8193,10,&temph) == 0){
	                        break;
	                    }
	                    sleep(5);
	                }
	                
	                json machines;
	                if(temph != 0){
	                    cnc_sysinfo( temph, &sysinfo);
	                    
	                    cnc_freelibhndl( temph );
	                    
	                    machines["machineIP"] = ips[i];
	                    machines["max_axis"] = sysinfo.max_axis;
	                    machines["cnc_type"] = string(sysinfo.cnc_type).substr(0,2);
	                    machines["mt_type"] = string(sysinfo.mt_type).substr(0,2);
	                    machines["series"] = string(sysinfo.series).substr(0,4);
	                    machines["version"] = string(sysinfo.version).substr(0,4);
	                    
	                    http.sendData("18.223.194.18","3000","/updateMachines/info","application/json",machines.dump().c_str()); 
	                    
	                    logActivities["machineIP"] = ips[i];
	                    logActivities["activity"] = "New machine successfully registed.";
	                    http.sendData("18.223.194.18","3000","/updateData/activities","application/json",logActivities.dump().c_str());
	                } else {
	                    logActivities["machineIP"] = ips[i];
	                    logActivities["activity"] = "ERRO: New machine not reachable.";
	                    http.sendData("18.223.194.18","3000","/updateData/activities","application/json",logActivities.dump().c_str());
	                }
	            }
	        }
	        
	        for(int i=0; i<ip_num; i++){
	            unsigned short h = 0;
	            for(int j=0; j<5; j++){
                    if(cnc_allclibhndl3(ips[i].c_str(),8193,10,&h) == 0){
                        break;
                    }
                    sleep(5);
                }
                
	            if(h != 0){
	                cnc_rdprgnum( h, &prgnum);
	                cnc_rdseqnum( h, &seqnum);
	                cnc_alarm2( h, &alarms);
	                
	                cnc_freelibhndl( h );
	                
	                json processInfo;
	                processInfo["machineIP"] = ips[i];
	                processInfo["main_program"] = prgnum.mdata;
	                processInfo["running_program"] = prgnum.data;
	                processInfo["running_sequence"] = seqnum.data;
	                
	                http.sendData("18.223.194.18","3000","/updateData/process","application/json",processInfo.dump().c_str());
	                
	                if(alarms != 0){
	                    for(int j=0; j<20; j++){
	                        if(alarms & 0x00000001){
	                            json alarmsInfo;
	                            alarmsInfo["machineIP"] = ips[i];
	                            alarmsInfo["alarm_type"] = j;
	                            
	                            http.sendData("18.223.194.18","3000","/updateData/alarms","application/json",alarmsInfo.dump().c_str());
	                        }
	                        alarms = alarms >> 1;
	                    }
	                }
	                
	                logActivities["machineIP"] = ips[i];
                    logActivities["activity"] = "Data sent.";
                    http.sendData("18.223.194.18","3000","/updateData/activities","application/json",logActivities.dump().c_str());
	            } else {
	                logActivities["machineIP"] = ips[i];
	                logActivities["activity"] = "ERRO: Machine not reachable.";
	                http.sendData("18.223.194.18","3000","/updateData/activities","application/json",logActivities.dump().c_str());
	            }
	        }
	    }
	    
	    cnc_exitprocess();
	    
	    sleep(20);
	}
	
	return 0;
}
