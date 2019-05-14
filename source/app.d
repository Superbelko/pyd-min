import core.thread;
import std.stdio;

import pyd.pyd;
import pyd.embedded;

shared static this() 
{
    // initializes Python interpreter before entering main()
    py_init();
}

void main() 
{
    // add current directory to PYTHONPATH, it is done by default on Windows but not on Linux
    // otherwise the following py_import will be unable to find the module
    py_stmts("import sys; sys.path += './'");

    // import python module
    auto stuff = py_import("stuff");

    // reads python variable to break the loop
    while(false == stuff.getattr("done").to_d!bool())
    {
        Thread.sleep(1.seconds);
        // try-catch inside the loop to allow 'live' changes
        try
        {
            // calls python function
            stuff.method("my_fun");
        }
        catch (PythonException e)
            writeln(e.msg);
    }
}

