//Parser for FBF

import std.file;
import std.stdio;
class FBFParser {
string f;
public:
 this(string a) {
  f = a;
 }
 void execute(string outFile) {
  File filename = File(outFile, "a");
  filename.writeln("#include <stdio.h>\n#include <stdint.h>\nint main(int argc, char* *argv) {");
  filename.writeln("char array[30000] = {0}; char *ptr = array;");
  foreach (char c;f)
  {
   if (c == '>') {
    filename.writeln("++ptr;");
   } else if (c == '<') {
    filename.writeln("--ptr;");
   } else if (c == '+') {
    filename.writeln("++*ptr;");
   } else if (c == '-') {
    filename.writeln("--*ptr;");
   } else if (c == '.') {
    filename.writeln("putchar(*ptr);");
   } else if (c == ',') {
    filename.writeln("*ptr = getchar();");
   } else if (c == '[') {
    filename.writeln("while (*ptr) {");
   } else if (c == ']') {
    filename.writeln("}");
   }
  }
  filename.writeln("}");
  filename.close();
 }
}
