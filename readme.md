# Minimal example using embedded Python with D

This demo is using Python 3.7, you will need to adjust dub.json paths to link the executable with your Python version.

This example shows how to load Python interpreter, read Python attributes and call functions.
Python side using importlib from standard library to dynamically reload module "calc", and call its result() function, that means you can change code at run time.

This example allows to do mixed Python/D debugging if you have the necessary plugins installed,
to debug Python you will need official MS Python extension, to debug D you will need MS C++ extension.

This example doesn't show packaging. It also doesn't use standard python library because you will likely have to copy the whole Python Lib folder, and depending on your use scenario it might be undesirable because of the modules that can interact with OS and filesystem for security reasons. In this case it is worth checking [RestrictedPython](https://github.com/zopefoundation/RestrictedPython) package.

## Prerequisites
* To run the example you need to get [ptvsd](https://github.com/microsoft/ptvsd) and copy the src directory from it to the project directory
* D compiler (obviously)
* Python interpreter (tested with 3.7 only)
