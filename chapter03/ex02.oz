declare
fun {CubeRoot X}
   fun {CRIter Guess}
      if {GoodEnough Guess} then Guess
      else {CRIter {Improve Guess}} end
   end
   fun {GoodEnough Guess}
      {Abs ((X-Guess*Guess*Guess) / X)} < 0.000001
   end
   fun {Improve Guess}
      (X/(Guess*Guess) + 2.0*Guess) / 3.0
   end
   Guess = 1.0
in
   {CRIter Guess}
end

{Browse {CubeRoot 27.0}}
{Browse {CubeRoot ~27.0}}