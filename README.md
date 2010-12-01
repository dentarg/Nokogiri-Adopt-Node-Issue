Setup
=====

Under JRuby 1.5.5, install the Triniad gem. Trinidad contains an embedded Tomcat runtime.

    gem install trinidad --no-rdoc --no-ri

Install other dependencies
    bundle install

Demo
====

The console demonstration
-------------------------

Run the console app, that demonstrates combining two XML docs.
    jruby -S console_app.rb 

Result:

    This is the sub document:

    <?xml version="1.0" encoding="UTF-8"?>
    <book>
        <author>Minty McMahon</author><title>Giraffes are so cool</title>
    </book>


    This is the full combined document:

    <?xml version="1.0" encoding="UTF-8"?>
    <books>
        <book>
           <author>Minty McMahon</author><title>Giraffes are so cool</title>
        </book>
    </books>

The web app demonstration under Trinidad/Tomcat
-----------------------------------------------

Run the sinatra app under Trinidad/Tomcat. This is the same code.
    jruby -S trinidad -r ./config.ru 

1. View http://localhost:3000/sub_doc; Everything should be fine.

2. View http://localhost:3000/full_doc - Web app explodes! 

Result:

    INFO: RuntimeError: org.jruby.exceptions.RaiseException: Failed to take ownership of node


The exception is raised in ./ext/java/nokogiri/XmlNode.java line 1239:

    ...

    if (doc != null && doc != otherNode.getOwnerDocument()) {
        Node ret = doc.adoptNode(otherNode);
        if (ret == null) {
            throw context.getRuntime().newRuntimeError("Failed to take ownership of node");
        }
    }

    ...
