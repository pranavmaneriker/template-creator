module ResumesHelper
	def getv(res,param)
		b = res.find_by_field_name(param)
		if b.nil?
			return 0
		else
			return b.field_data
		end
	end
end
