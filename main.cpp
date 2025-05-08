#include <iostream>
#include <fstream>
#include <string> 
#include <map>
#include <sstream>

using namespace std; 


int main() {



    string line_in, line_out, instruction, opcode, reg_comma, value;   // string variables    
    string reg;
    int i = 0;

    //////////////////////////////////////////////////////////////////////////////// mapping 
    map<string, string> opcodeMap = {    // map each instruction  
        {"LOAD", "03"},
        {"INC",  "11"},
        {"DEC",  "12"},
        {"ADD",  "01"},
        {"JNZ",  "10"},
        {"JMP",  "0E"}
    };
    //////////////////////////////////////////////////////////////////////////////// opening  assembly code file 

    ifstream file("assembly_code.txt");             // opening the assembly code txt 

    if (!file.is_open()) {                        //  check if file is open 
        cout << "Failed to open the file!" << endl;
        return 1;
    }
    //////////////////////////////////////////////////////////////////////////////////  Reading the assembly file 
    ofstream clearFile("output.txt");
    // ofstream outFile("output.txt", ios::app);
    // outFile << "-- INSERT GENERATED CONTENT HERE" << endl;
    clearFile.close();

    while (getline(file, line_in)) {                 // read line by line 
        if(!line_in.empty()) {
        i += 2;
        cout << line_in << endl;                     // Print each line

        stringstream ss(line_in);                    // stream the line 
        ss >> opcode >> reg_comma >> value;          //  get the first word 
        reg = reg_comma[0];

       
        cout << opcode << endl;
        cout << reg << endl;
        cout << value << endl;

        if (opcode == "LOAD") {
            if (reg == "A") {
                if (value.length() > 2) {
                    line_out = "0F";

                }
                else {
                    line_out = "03";
                }

            }

            else if (reg == "C") {
                line_out = "09";
            }

            else {
                line_out = "08";

            }
        }
        else if (opcode == "INC") {
            value = "";
            if (reg == "A") {
                line_out = "11";
            }

            else {
                line_out = "33";

            }


        }
        else if (opcode == "DEC") {
            value = "";
            if (reg == "A") {
                line_out = "12";
            }

            else {
                line_out = "44";

            }


        }

        else if (opcode == "ADD") {

            if (reg == "A") {
                line_out = "01";
            }

            else if (reg == "C") {
                line_out = "0A";
            }

            else {
                line_out = "instruction not defined ";

            }


        }

        else if (opcode == "SUB") {

            if (reg == "A") {
                line_out = "02";
            }

            else {
                line_out = "instruction not defined ";

            }


        }

        else if (opcode == "store") {

            if (reg == "A") {
                line_out = "06";
            }

            else if (reg == "(" && reg_comma == "(C),") {

                line_out = "0E";
            }

            else {
                line_out = "instruction not defined ";

            }
            cout << value.length();

        }

        else if (opcode == "AND") {

            if (reg == "A") {
                line_out = "04";
            }

            else {
                line_out = "instruction not defined ";

            }


        }

        else if (opcode == "OR") {

            if (reg == "A") {
                line_out = "05";
            }

            else {
                line_out = "instruction not defined ";

            }


        }

        else if (opcode == "JUMP") {

            if (reg == ",") {
                line_out = "07";
            }

            else {
                line_out = "instruction not defined ";

            }


        }

        else if (opcode == "JUMPNZ") {

            if (reg == ",") {
                line_out = "10";
            }

            else {
                line_out = "instruction not defined ";

            }


        }

        ofstream outFile("output.txt", ios::app);  // creates or overwrites output.txt

        if (!outFile) {
            cout << "Error opening file for writing!" << endl;
            return 1;
        }

        outFile << i << "=> X" << "\"" << line_out << "\"" << "," << endl;
        if (value != "") {

            if (value.length() == 4 && value[0] != '(') {
                string first = value.substr(0, 2);  // de l’index 0, longueur 2 → "A1"
                string second = value.substr(2, 2); // de l’index 2, longueur 2 → "B2"
                outFile << i + 1 << "=> X" << "\"" << first << "\"" << "," << endl;
                outFile << i + 2 << "=> X" << "\"" << second << "\"" << "," << endl;

                i += 1;
            }
            else if (value[0] != '(') {
                outFile << i + 1 << "=> X" << "\"" << value << "\"" << "," << endl;
            }

        }
        else {
            i = i - 1;
        }

        outFile.close();  // always good to close the file
    }
}

     file.close();  // Close the file*/    


     ifstream baseFile("Programe_memory.txt");
     ifstream dataFile("output.txt");
     ofstream tempFile("temp.txt");


     if (!baseFile.is_open() || !dataFile.is_open() || !tempFile.is_open()) {
         cerr << "Error: Could not open one of the files." << endl;
         return 1;
     }
     bool insideGeneratedBlock = false;
     string line;
  
     while (getline(baseFile, line)) {
  
         if (line.find("-- INSERT GENERATED CONTENT HERE") != string::npos) {
             tempFile <<  line << endl;
             insideGeneratedBlock = true;
             string dataLine;
             while (getline(dataFile, dataLine)) {
                 if (!dataLine.empty()) {
                     tempFile << "    " << dataLine << endl;
                 }
             }
             tempFile << "-- END OF GENERATED CONTENT HERE" << endl;
             
         }
         else if (line.find("-- END OF GENERATED CONTENT HERE") != string::npos) {
             insideGeneratedBlock = false;
             tempFile << line << endl; // Keep the END marker
         }
         // Copy lines from the base file when not inside the generated block
         else if (!insideGeneratedBlock) {
             tempFile << line << endl;
         }
     }

     baseFile.close();
     dataFile.close();
     tempFile.close();

     // Replace the original file with the updated one
     remove("Programe_memory.txt");
     rename("temp.txt", "Programe_memory.txt");

     cout << "✅ memory.vhdl updated in place!" << endl;
     
     ifstream source("Programe_memory.txt");
     ofstream dest("C:\\Users\\nassi\\8bit_cpu\\8bit_cpu.srcs\\sources_1\\new\\memoire_programe.vhd");

     if (!source.is_open() || !dest.is_open()) {
         cerr << "Error opening files!" << endl;
         return 1 ;
     }

     string line_F;
     while (getline(source, line_F)) {
         dest << line_F << endl;
     }

     source.close();
     dest.close();

     cout << "✅ Overwrote " << "vhdlFile"  << " with generated machine code!" << endl;
     

    return 0;
}





/*if (opcodeMap.count(opcode)) {            // is the word exists in map List
          line_out = opcodeMap[opcode];         // map the instruction
          cout << "Opcode: " << line_out << endl;
      }
      else {
          cout << "Unknown instruction: " << instruction << endl;
      }*/
