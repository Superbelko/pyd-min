# Minimal example using embedded Python with D

This demo is using Python 3.7, you will need to adjust dub.json paths to link the executable with your Python version.

This example shows how to load Python interpreter, read Python attributes and call functions.
Python side using importlib from standard library to dynamically reload module "calc", and call its result() function, that means you can change code at run time.

This example allows to do mixed Python/D debugging using Visual Studio Code if you have the necessary plugins installed,
to debug Python you will need official MS Python extension, to debug D you will need MS C++ extension. Note that ptvsd works on Linux as well, allowing the same debugging capabilities on Linux as well.

This example doesn't show packaging. It also doesn't use standard python library because you will likely have to copy the whole Python Lib folder, and depending on your use scenario it might be undesirable because of the modules that can interact with OS and filesystem for security reasons. In this case it is worth checking [RestrictedPython](https://github.com/zopefoundation/RestrictedPython) package.

## Prerequisites
* To run the example you need to get [ptvsd](https://github.com/microsoft/ptvsd) and copy the content of src directory to the project directory
* D compiler (obviously)
* Python interpreter (tested with 3.7 only)
* (Linux) dev package for python might be necessary (Ubuntu)


## Build

```
dub build --arch=x86_64
```
--arch can be omitted, other options are x86 and x86_mscoff (Windows only)

# Mixed Debugging (VS Code)

Normal debug is done by choosing the debug config to run. However it might be confusing how to get both Native/Python debuggers at the same time.

So how to do both?

First start with native debug configuration, then on top of the debug pallette choose python debugger and hit run. Done! You can now place breakpoints in both .d and .py files.

> Note: to place breakpoints in D files you might need to enable "Allow breakpoints everywhere" option in settings (Control-comma)

# Packaging

This example doesn't show how to pack and ship your final executable. However it is worth mentioning that by default python engine is built as shared libarary, that means you need to copy python37.dll and possibly Lib directory from Python installation next to your program. 
And possibly add the sys.path to that Lib folder for Python.

On Linux additionally you have to add RPATH or other shared library search path because working directory is not added by default, more on this you can find on the Internet as I am no Linux expert.