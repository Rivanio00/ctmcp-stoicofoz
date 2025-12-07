declare
proc {TryFinally S1 S2} 
   B Y in 
   try {S1} B=false
   catch X then B=true Y=X end 
   {S2} 
   if B then raise Y end end 
end 

local U=1 V=2 in 
   {TryFinally 
      proc {$} 
         thread 
            {TryFinally 
               proc {$} U=V end
               proc {$} {Browse bing} end} 
         end 
      end 
      proc {$} {Browse bong} end} 
end