module ApplicationHelper
	def full_title(title)
		base_title = 'Ruby On Rails Sample App'
		if title.empty?
			base_title		
		else
			"#{base_title} | #{title}"
		end	
	end
end
