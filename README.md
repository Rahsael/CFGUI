# The Carrion Fields Client
This is a fully featured modification for Mudlet. Download Mudlet at www.mudlet.org, and visit Carrion Fields at www.carrionfields.net, or connect to carrionfields.net:4449

To install the Carrion Fields Mudlet Skin:

Step 1: Download Mudlet at www.mudlet.org.
Step 2: In Mudlet, create a new profile that connects to Carrion Fields (carrionfields.net port 4449).
Step 3: Copy and paste the following line of code into the input bar and hit enter:

lua function d(a,b)if not b:find("CFGUI",1,true)then return end installPackage(b)os.remove(b)cecho("<gold>Package installed!\n")end registerAnonymousEventHandler("sysDownloadDone","d")downloadFile(getMudletHomeDir().."/CFGUI.zip","https://github.com/Rahsael/CFGUI/releases/latest/download/CFGUI.zip")

Send questions, bugs, or feature requests to rahsael@carrionfields.com
