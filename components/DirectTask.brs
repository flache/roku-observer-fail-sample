function init()
  print "DirectTask: init()"

  m.top.functionName = "run"
end function

function run()
  print "DirectTask: runt()"

  indirectTask = CreateObject("roSGNode", "IndirectTask")
  indirectTask.observeField("finished", "indirectFinished")
  indirectTask.control = "run"
end function

function indirectFinished()
  print "DirectTask: indirectFinished()"

  ' this will get called for the m.wontFail instance in the Test Scene
  ' but not for the willFail instance
  m.top.finished = true
end function
