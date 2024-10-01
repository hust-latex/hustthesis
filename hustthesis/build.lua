#!/usr/bin/env texlua

module = "hustthesis"
typesetexe = "xelatex"
packtdszip = true
-- sourcefiles = {"*.dtx"}
unpackfiles = {"*.dtx"}
installfiles = {"*.cls", "*.ins"}

tdslocations = {
	"source/latex/" .. module .. "/*.ins",
}

function update_tag(file, content, tagname, tagdate)
	tagname = tagname:gsub("^v(%d.*)$", "%1")
	if not file:match("%.dtx$") then
		return content
	end
	local replaced_sign = "%^%^A %[L3BUILD_REPLACED_MARK%]"
	content = content:gsub("([^%c]-)%[DEV%]([^%c]-" .. replaced_sign .. ")", "%1" .. tagname .. "%2")
	content = content:gsub("([^%c]-)%[LATEST%]([^%c]-" .. replaced_sign .. ")", "%1" .. tagdate .. "%2")
	content = content:gsub(replaced_sign, "")
	return content
end
