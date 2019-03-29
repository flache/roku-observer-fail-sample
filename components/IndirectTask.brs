function init()
  print "IndirectTask: init()"

  m.top.functionName = "run"
end function

function run()
  print "IndirectTask: run()"

  m.top.finished = true
end function
