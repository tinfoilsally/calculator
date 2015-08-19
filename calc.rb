
Shoes.app(title: "Calculator", width: 200, height: 240) do

	number_field = nil #displays the number field
	@number = 0 #set actual value of number
	@op = nil #operations variable
	@previous = 0 #catch previous number
	
	#number field
		flow width: 0.7, height: 0.2 do #70% flow (top row)
			background rgb(0, 157, 228)
			number_field = para @number, margin: 10 #changed number field to para, set to 0 via @number
		end 

	#clear button
	flow width: 0.3, height: 0.2 do #remaining 30% flow (top row)
	button 'CLR', width: 1.0, height: 1.0 do #100% of available flow space
			@number = 0 #every time clr is pressed, @number = 0 again
			number_field.replace(@number) #change actual value of number_field to 0
		end
	end
	
	#other buttons
	flow width: 1.0, height: 0.8 do #100% flow horizontally (second row +) and 80% of columns
		background rgb(139, 203, 236)
		%w(7 8 9 + 4 5 6 _ 1 2 3 / 0 . = *).each do |btn| #%w method, add every button to each loop
			button btn, width: 50, height: 50 do #h&w in pixels
				case btn #case statement for number buttons
					when /[0-9]/
						@number = @number.to_i * 10 + btn.to_i #change @number to integer, *10, + button input as integer						
						number_field.replace(@number) #change actual value of number_field to input - this wasn't in the tutorial
					#calculation button
					when '='
						@number = @previous.send(@op, @number) #[present number].send([operation], [input number])
						number_field.replace(@number) #change actual value of number_field to result - this wasn't in the tutorial
					#all other operator buttons
					else
						@previous, @number = @number, nil #@number is unchanged
						@op = btn #operation is the button pressed
						number_field.replace(@op) #change actual value of number_field to operation symbol - this wasn't in the tutorial
					end
			end
			number_field.replace(@number) #replace the value of @number with the value of the button
		end
	end
	
end #end for Shoes.app
