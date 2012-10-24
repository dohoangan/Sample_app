module ApplicationHelper
	def full_title(title)
		base_title = 'Probases'
		if title.empty?
			base_title		
		else
			"#{base_title} | #{title}"
		end	
	end
end
