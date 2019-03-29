function init()
  print "TestScene: init()"

  m.outpRoot = m.top.findNode("outpRoot")

  ' spawning two tasks, only difference here is that m.wontFail is attached to m while willFail is not
  m.wontFail = CreateObject("roSGNode", "DirectTask")
  m.wontFail.observeField("finished", "wontFailFinished")
  m.wontFail.control = "RUN"

  willFail = CreateObject("roSGNode", "DirectTask")
  willFail.observeField("finished", "willFailFinished")
  willFail.control = "RUN"

  ' this will work
  ' m.willFail = CreateObject("roSGNode", "DirectTask")
  ' m.willFail.observeField("finished", "willFailFinished")
  ' m.willFail.control = "RUN"

end function

function wontFailFinished(event as object)
  print "TestScene: wontFailFinished()"

  ' btw I don't even need the m.wontField reference here if I want to access the tasks data
  ' i can simply do event.getData() or event.getNode()


  write("m.wontFail has finished!")

end function

function willFailFinished(event as object)
  ' this function will never get called
  print "TestScene: willFailFinished()"

  write("willFail has finished!")

end function

function write(text)
  label = CreateObject("roSGNode", "SimpleLabel")
  label.color = "#FFFFFF"
  label.text = text
  m.outpRoot.appendChild(label)
end function
