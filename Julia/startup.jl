# Display the entire type hierarchy starting from the specified 'roottype'
push!(LOAD_PATH, "$(homedir())/Desktop/Coding/Julia")

using Debugger
using Infiltrator
using OhMyREPL

try
    using Revise
catch e
    @warn "Error initializing Revise" exception=(e, catch_backtrace())
end

function subtypetree(roottype, level=1, indent=4)
	level == 1 && println(roottype)
	for s in subtypes(roottype)
		println(join(fill(" ", level*indent)) * string(s))
		subtypetree(s, level+1, indent)
	end
end

macro isdefined(var)
  quote
      try
          local _ = $(esc(var))
          true
      catch err
          isa(err, UndefVarError) ? false : rethrow(err)
      end
  end
end

function workspace()
   atexit() do
       run(`$(Base.julia_cmd())`)
   end
   exit()
end


