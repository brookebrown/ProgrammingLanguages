-- Brooke Brown 
-- Ada HW Fall 2017
-- Read in some number of patient data and determine whether test 1, test 2, or neither test is better.

with Ada.Text_IO;
with Ada.Float_Text_Io;
with Ada.Integer_Text_Io;
use Ada.Text_IO;
use Ada.Float_Text_Io;
use Ada.Integer_Text_Io;

procedure getPatResults is
        numPats : Integer;
        type PArray is array (1..1000, 1..4) of Integer;
        patArray : PArray;
        count0: Float := 0.0;
        count1: Float := 0.0;
        count2: Float := 0.0;
        count3: Float := 0.0;
        count4: Float := 0.0;
        count5: Float := 0.0;
        count6: Float := 0.0;
        count7: Float := 0.0;
        pDgivenPos1, pDgivenPos2, pHgivenNeg1, pHgivenNeg2: Float;

begin
        put_line("Enter number of patients.");
        get(numPats);

	-- Enters input into patient array
        put_line("Enter patients data.");
        for row in 1..numPats loop
                get(patArray(row, 1));
                get(patArray(row, 2));
                get(patArray(row, 3));
                get(patArray(row, 4));
        end loop;

	-- Tests if input is entered correctly.
    --    put_line("PatArray is:");
    --    for row in 1..numPats loop
    --            for col in 1..4 loop
    --                    put(PatArray(row, col));
    --            end loop;
    --            new_line;
    --    end loop;
			
	-- Calculates probability for P(D | Pos1) and P(H | Neg1)
	for row in 1..numPats loop 
	    if patArray(row, 3) = 1 then
      	        count0 := count0 + 1.0;
	        if patArray(row, 2) = 1 then
	            count1 := count1 + 1.0;
	        end if;
				
	    elsif patArray(row, 3) = 0 then
	        count2 := count2 + 1.0;
		if patArray(row, 2) = 0 then
		    count3 := count3 + 1.0;
		end if;
		
	    else
	        put("Error: test 1 input is incorrect.");
	    end if;
	end loop;
		
        -- Calculates probability for P(D | Pos2) and P(H | Neg2)	
        for row in 1..numPats loop 
	    if patArray(row, 4) = 1 then
	        count4 := count4 + 1.0;
	        if patArray(row, 2) = 1 then
	            count5 := count5 + 1.0;
	        end if;
				
	    elsif patArray(row, 4) = 0 then
	        count6 := count6 + 1.0;
		if patArray(row, 2) = 0 then
	            count7 := count7 + 1.0;
		end if;
					
	    else
     	        put("Error: test 2 input is incorrect.");
	    end if;
	end loop;
			
	pDgivenPos1 := count1 / count0;
	pDgivenPos2 := count5 / count4;
	pHgivenNeg1 := count3 / count2;
	pHgivenNeg2 := count7 / count6;

        put("P(D | Pos1) = ");
	put(pDgivenPos1, 2, 2, 0);
	new_line;
	put("P(D | Pos2) = ");
	put(pDgivenPos2, 2, 2, 0);
	new_line;
	put("P(H | Neg1) = ");
	put(pHgivenNeg1, 2, 2, 0);
	new_line;
	put("P(H | Neg2) = ");
	put(pHgivenNeg2, 2, 2, 0);
	new_line;
	
        -- Compares which test is better.	
	if pDgivenPos1 > pDgivenPos2 and pHgivenNeg1 > pHgivenNeg2 then
	    put_line("Test 1 is better");
	elsif pDgivenPos2 > pDgivenPos1 and pHgivenNeg2 > pHgivenNeg1 then
	    put_line("Test 2 is better");
	else
	    put_line("Neither test is better");
	end if;

end getPatResults;

