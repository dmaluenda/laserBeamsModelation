% David Maluenda Niubó - Applied Physics and Optics (UB)
% Smooths caracterization curves.

curve = 0;
while true
	curve = curve + 1
	clear data
	switch curve
		case 1
			if exist('A1')
				data = A1;
			else
				continue
			end
		case 2
			if exist('A2')
				data = A2;
			else
				continue
			end
		case 3
			if exist('phi1_45')
				data = phi1_45;
			else
				continue
			end
		case 4
			if exist('phi1_135')
				data = phi1_135;
			else
				continue
			end
		case 5
			if exist('phi2_45')
				data = phi2_45;
			else
				continue
			end
		case 6
			if exist('phi2_135')
				data = phi2_135;
			else
				continue
			end
		case 7
			if exist('phi1')
				data = phi1;
			else
				continue
			end
		case 8
			if exist('phi2')
				data = phi2;
			else
				continue
			end
		otherwise
			disp(' ... finished.')
			break
	end
	if exist('data')
		figure
		plot(data)
		while numel(input('Type any character to stop smothing ... ', 's')) == 0
			for i = 2:255
		    	data(i)=mean([data(i-1) data(i-1) data(i) data(i+1) data(i+1)]);
		    end
		    plot(data)
		end
		switch curve
			case 1
				A1 = data;
			case 2
				A2 = data;
			case 3
				phi1_45 = data;
			case 4
				phi1_135 = data;
			case 5
				phi2_45 = data;
			case 6
				phi2_135 = data;
			case 7
				phi1 = data;
			case 8
				phi2 = data;
			otherwise
				break
		end
	end
end