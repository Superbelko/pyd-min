import core.thread;
import std.stdio;
import pyd.pyd;
import pyd.embedded;
import deimos.python.Python: Py_ssize_t, Py_Initialize;

shared static this() 
{
    // initializes Python interpreter before entering main()
    py_init();
}

void main() 
{
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

