#include "fwlib32.h"
#include "http.hpp"
#include <cstdio>
#include <nlohmann/json.hpp>
using namespace std;
using json = nlohmann::json;
int main(int argc, char** argv)
{
    json g;
    json s;
    int num_of_machines;
    char get_ips[300];
    char send_buffer[100];
    char val[5];
    unsigned short h;
    short ret;
    short num = MAX_AXIS;
    cnc_startupprocess(0, "teste.log");
    ODBST buf;
    ODBACT buf_spin;
    ODBPOS pos[MAX_AXIS];
    HTTP http;

    // get request from machines ip and holds the number of machines
    http.getData("52.67.46.36", "80", "/exemplo/api/maquina", get_ips);
    printf("get_ips = %s\n",get_ips);
    g = json::parse(get_ips);
    printf("After parse\n");
    num_of_machines = g.size();
    printf("After size\n");
    printf("num_of_machines = %d\n", num_of_machines);
    printf("ip = %s\n", string(g[0]["ip"]).c_str());
    printf("ip = %s\n", string(g[1]["ip"]).c_str());
    printf("ip = %s\n", string(g[2]["ip"]).c_str());
    //for each machine.
    for (int i = 0;i == num_of_machines-1; i++)
    {
        printf("Before ret");
        //creates the ret to the current machine ip
        ret = cnc_allclibhndl3( string(g[i]["ip"]).c_str(), 8193, 10, &h );
        printf("After ret");
        if (!ret)
        {
            printf("Inside if");
            //runs the function to get the machine position
            cnc_rdposition(h, 0, &num, pos);
            //add to val each one of the collected positions
            int idx;
            for(idx = 0 ; idx < num ; idx++) 
            {
                printf("Inside for");
                printf("%c = %d\n", pos[idx].abs.name, (int)pos[idx].abs.data);
                val[idx] = (char)pos[idx].abs.data;
            }
            s["ip"] = g[i]["ip"];
            s["Pos_X"] = val[0];
            s["Pos_Y"] = val[1];
            s["Pos_Z"] = val[2];
            s["Pos_A"] = val[3];
            s["Pos_B"] = val[4];
            
            http.sendData("18.229.150.206", "3000","/api/data", "application/json",s.dump().c_str());
            printf("After send data");
            cnc_freelibhndl( h );
        }
        else 
        {
            printf("Falha na conexao\n");
        }
        printf("Before exit process");
        cnc_exitprocess( );
        return 1;
    }
}
