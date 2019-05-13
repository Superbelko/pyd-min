import importlib

# Visual Studio debugger
# get it from https://github.com/microsoft/ptvsd and copy src folder next to the dub.json
import ptvsd

# Listen for debugger
ptvsd.enable_attach(address = ('127.0.0.1', 3000))

# Native code reads this attribute to drive the loop. Set to true to break program main loop
done = False

# This function is loaded and called from native code
def my_fun():
    # (note to self)
    # See also
    #  module_spec = importlib.util.find_spec(module_name)
    #  module = importlib.util.module_from_spec(module_spec)
    #  module_spec.loader.exec_module(module)
    mod = importlib.import_module('calc')
    if mod is not None:
        mod = importlib.reload(mod)
        print(mod.result(3))

# Enable the below line of code only if you want the application to wait untill the debugger has attached to it
#ptvsd.wait_for_attach()
