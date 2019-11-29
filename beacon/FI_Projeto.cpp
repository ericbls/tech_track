#include "fwlib32.h"
#include "http.hpp"
#include <nlohmann/json.hpp>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <iostream>
#include <ctime>

using namespace std;
using json = nlohmann::json;

void getIPs(HTTP* http, json* j){

    char dados[300];
    int ret = (*http).getData("18.223.194.18","80","/techtrack/func/dados",dados);
    
    if(!ret){
        *j = json::parse(dados);
    }
}

void sendData(HTTP* http, json* j, json* jbuf, int run){
    (*j)["run"] = run;
    
    time_t now = time(0);
    tm *ltm = localtime(&now);
    
    char data[25];
    sprintf(data,"%04d-%02d-%02d %02d:%02d:%02d", 1900 + ltm->tm_year, 1 + ltm->tm_mon, ltm->tm_mday, ltm->tm_hour, ltm->tm_min, ltm->tm_sec);
    
    json tempj;
    tempj["date"] = data;
    tempj["id"] = (*j)["id"];
    tempj["ip"] = (*j)["ip"];
    tempj["run"] = run;
    
    *jbuf += tempj;
    
    int ret = (*http).sendData("18.223.194.18","80","/techtrack/func/dados","application/json",(*jbuf).dump().c_str());
    
    if(!ret){
        *jbuf = json::array();
    }
}

int main(){
    cnc_startupprocess(0, "teste.log");
    
    unsigned short temph = 0;
    unsigned short temprun = 0;
    
    json j = json::array();
    json jbuf = json::array();
    
    HTTP http;
    
    ODBSYS sysinfo;
    ODBST statinfo;
    
    getIPs(&http, &j);
    
    time_t t1 = time(0);
    time_t t2 = t1;
    time_t t3 = t1;
    while(true){
        t1 = time(0);
        
        if(difftime(t1,t2) >= 300){
            t2 = t1;
            
            getIPs(&http, &j);
        }
        
        if(difftime(t1,t3) >= 15){
            t3 = t1;
            
            for(int i=0; i<j.size(); i++){
                if(cnc_allclibhndl3(string(j[i]["ip"]).c_str(),8193,10,&temph) == 0){
                    cnc_sysinfo(temph, &sysinfo);
                    cnc_statinfo(temph, &statinfo);
                    
                    std::cout << j[i]["ip"] << " " << statinfo.run << std::endl;
                    
                    if((sysinfo.cnc_type[0] == '1') && (sysinfo.cnc_type[1] == '5')){
                        std::cout << "15" << std::endl;
                        if((statinfo.run == 0) || (statinfo.run == 8)){
                            temprun = 0;
                        } else {
                            temprun = 1;
                        }
                    } else if(sysinfo.mt_type[1] == 'W'){
                        std::cout << "W" << std::endl;
                        if((statinfo.run == 0) || (statinfo.run == 4)){
                            temprun = 0;
                        } else {
                            temprun = 1;
                        }
                    } else {
                        std::cout << "else" << std::endl;
                        if((statinfo.run == 0) || (statinfo.run == 1)){
                            temprun = 0;
                        } else {
                            temprun = 1;
                        }
                    }
                    
                    std::cout << j[i]["ip"] << " " << temprun << std::endl;
                    
                    if(temprun != j[i]["run"]){
                        sendData(&http, &(j[i]), &jbuf, temprun);
                    }
                    
                    cnc_freelibhndl( temph );
                }
            }
        }
    }
}
