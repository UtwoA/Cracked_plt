__version__ = __rev__ == 3 and "3.5.67" or "2.7.9"
__author__ = "Cracked"
__email__ = "Cracked"
__telegram__ = "Cracked"
__discord__ = "Cracked"

script_properties("work-in-pause")
print("PALATKA ARIZONA: " .. __version__ .. "." .. __build__)

MAIN_TITLE = "Palatka"
MAIN_CMD = "plt"

function xcfg_append(arg_1_0, arg_1_1)
	ecfg.mkpath(arg_1_0)

	local var_1_0 = io.open(arg_1_0, "a+")

	if var_1_0 then
		var_1_0:write(arg_1_1)
		var_1_0:close()

		return true
	else
		return false
	end
end

function renderFigure2D(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4, arg_2_5)
	arg_2_0 = arg_2_0 + arg_2_4 / 2
	arg_2_1 = arg_2_1 + arg_2_4 / 2

	local var_2_0 = math.pi * 2 / arg_2_2
	local var_2_1 = {}
	local var_2_2 = {}

	for iter_2_0 = 0, math.pi * 2, var_2_0 do
		if iter_2_0 + var_2_0 >= math.pi * 2 then
			var_2_0 = math.pi * 2 - iter_2_0
		end

		var_2_1[1] = arg_2_3 * math.cos(iter_2_0) + arg_2_0
		var_2_1[2] = arg_2_3 * math.sin(iter_2_0) + arg_2_1
		var_2_2[1] = arg_2_3 * math.cos(iter_2_0 + var_2_0) + arg_2_0
		var_2_2[2] = arg_2_3 * math.sin(iter_2_0 + var_2_0) + arg_2_1

		renderDrawLine(var_2_1[1], var_2_1[2], var_2_2[1], var_2_2[2], arg_2_4, arg_2_5)
	end
end

function isCursorInArea2D(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	local var_3_0, var_3_1 = getCursorPos()

	return arg_3_0 <= var_3_0 and var_3_0 <= arg_3_2 and arg_3_1 <= var_3_1 and var_3_1 <= arg_3_3
end

Fcfg = {
	_author = "Cracked",
	_email = "Cracked",
	_version = 1
}

function Fcfg.__init()
	local var_4_0 = {}

	local function var_4_1(arg_5_0)
		return string.format("%q", arg_5_0)
	end

	local function var_4_2(arg_6_0, arg_6_1)
		local var_6_0 = arg_6_1 or ""
		local var_6_1 = {}

		for iter_6_0, iter_6_1 in pairs(arg_6_0) do
			if type(iter_6_1) == "string" then
				if type(iter_6_0) == "number" and iter_6_0 <= #arg_6_0 then
					table.insert(var_6_1, var_4_1(iter_6_1))
				else
					table.insert(var_6_1, draw_var_or_key(iter_6_0) .. " = " .. var_4_1(iter_6_1))
				end
			elseif type(iter_6_1) == "number" or type(iter_6_1) == "boolean" then
				if type(iter_6_0) == "number" and iter_6_0 <= #arg_6_0 then
					table.insert(var_6_1, tostring(iter_6_1))
				else
					table.insert(var_6_1, draw_var_or_key(iter_6_0) .. " = " .. tostring(iter_6_1))
				end
			elseif type(iter_6_1) == "table" then
				if type(iter_6_0) == "number" and iter_6_0 <= #arg_6_0 then
					table.insert(var_6_1, var_4_2(iter_6_1, var_6_0 .. "\t"))
				else
					table.insert(var_6_1, draw_var_or_key(iter_6_0) .. " = " .. var_4_2(iter_6_1, var_6_0 .. "\t"))
				end
			elseif type(iter_6_0) == "number" and iter_6_0 <= #arg_6_0 then
				table.insert(var_6_1, var_4_1(tostring(iter_6_1)))
			else
				table.insert(var_6_1, draw_var_or_key(iter_6_0) .. " = " .. var_4_1(tostring(iter_6_1)))
			end
		end

		if #var_6_1 == 0 and var_6_0 == "" then
			return ""
		elseif #var_6_1 == 0 then
			return "{}"
		elseif var_6_0 == "" then
			return table.concat(var_6_1, ",\n") .. ",\n"
		else
			return "{\n" .. var_6_0 .. table.concat(var_6_1, ",\n" .. var_6_0) .. ",\n" .. var_6_0:sub(2) .. "}"
		end
	end

	local function var_4_3(arg_7_0, arg_7_1)
		if type(arg_7_0) == "string" then
			return var_4_1(arg_7_0)
		elseif type(arg_7_0) == "number" or type(arg_7_0) == "boolean" or type(arg_7_0) == "nil" then
			return tostring(arg_7_0)
		elseif type(arg_7_0) == "table" then
			return var_4_2(arg_7_0, arg_7_1)
		else
			return var_4_1(tostring(arg_7_0))
		end
	end

	local function var_4_4(arg_8_0)
		if type(arg_8_0) == "string" then
			return var_4_1(arg_8_0)
		elseif type(arg_8_0) == "number" then
			return tostring(arg_8_0)
		end
	end

	local function var_4_5(arg_9_0)
		if type(arg_9_0) == "string" and arg_9_0:match("^[_%a][_%a%d]*$") then
			return true
		else
			return false
		end
	end

	local function var_4_6(arg_10_0)
		local var_10_0 = {}

		for iter_10_0, iter_10_1 in pairs(arg_10_0) do
			if type(iter_10_0) == "number" then
				table.insert(var_10_0, "table.insert(tbl, " .. var_4_3(iter_10_1, "\t") .. ")")
			elseif type(iter_10_0) == "string" then
				if var_4_5(iter_10_0) then
					table.insert(var_10_0, "tbl." .. draw_var(iter_10_0) .. " = " .. var_4_3(iter_10_1, "\t"))
				else
					table.insert(var_10_0, "tbl[" .. var_4_1(iter_10_0) .. "] = " .. var_4_3(iter_10_1, "\t"))
				end
			end
		end

		if #var_10_0 == 0 then
			return ""
		else
			return table.concat(var_10_0, "\n") .. "\n"
		end
	end

	function var_4_0.load(arg_11_0, arg_11_1)
		assert(type(arg_11_0) == "string", ("bad argument #1 to 'load' (string expected, got %s)"):format(type(arg_11_0)))

		local var_11_0 = io.open(arg_11_0, "r")

		if var_11_0 then
			local var_11_1 = var_11_0:read("*all")

			var_11_0:close()

			local var_11_2 = loadstring("local tbl = {}\n" .. var_11_1 .. "\nreturn tbl")

			if var_11_2 then
				local var_11_3 = var_11_2()

				if type(var_11_3) == "table" then
					if arg_11_1 then
						var_4_0.save(arg_11_0, var_11_3)
					end

					return var_11_3
				end
			end
		end
	end

	function var_4_0.save(arg_12_0, arg_12_1)
		assert(type(arg_12_0) == "string", ("bad argument #1 to 'table_save' (string expected, got %s)"):format(type(arg_12_0)))
		assert(type(arg_12_1) == "table", ("bad argument #2 to 'table_save' (table expected, got %s)"):format(type(arg_12_1)))
		var_4_0.mkpath(arg_12_0)

		local var_12_0 = io.open(arg_12_0, "w+")

		if var_12_0 then
			local var_12_1 = var_4_6(arg_12_1)

			var_12_0:write(var_12_1)
			var_12_0:close()

			return true
		else
			return false
		end
	end

	function var_4_0.insert(arg_13_0, arg_13_1, arg_13_2)
		assert(type(arg_13_0) == "string", ("bad argument #1 to 'insert' (string expected, got %s)"):format(type(arg_13_0)))

		if arg_13_2 then
			assert(type(arg_13_1) == "number", ("bad argument #2 to 'insert' (number expected, got %s)"):format(type(arg_13_1)))
		end

		local var_13_0

		if arg_13_2 then
			var_13_0 = "table.insert(tbl, " .. arg_13_1 .. ", " .. var_4_3(arg_13_2, "\t") .. ")"
		else
			var_13_0 = "table.insert(tbl, " .. var_4_3(arg_13_1, "\t") .. ")"
		end

		var_4_0.mkpath(arg_13_0)

		local var_13_1 = io.open(arg_13_0, "a+")

		if var_13_1 then
			var_13_1:write(var_13_0 .. "\n")
			var_13_1:close()

			return true
		else
			return false
		end
	end

	function var_4_0.table_remove(arg_14_0, arg_14_1)
		assert(type(arg_14_0) == "string", ("bad argument #1 to 'remove' (string expected, got %s)"):format(type(arg_14_0)))
		assert(type(arg_14_1) == "number" or arg_14_1 == nil, ("bad argument #2 to 'remove' (number or nil expected, got %s)"):format(type(arg_14_1)))

		local var_14_0

		if arg_14_1 then
			var_14_0 = "table.remove(tbl, " .. arg_14_1 .. ")"
		else
			var_14_0 = "table.remove(tbl)"
		end

		var_4_0.mkpath(arg_14_0)

		local var_14_1 = io.open(arg_14_0, "a+")

		if var_14_1 then
			var_14_1:write(var_14_0 .. "\n")
			var_14_1:close()

			return true
		else
			return false
		end
	end

	function var_4_0.set(arg_15_0, arg_15_1, arg_15_2)
		assert(type(arg_15_0) == "string", ("bad argument #1 to 'set' (string expected, got %s)"):format(type(arg_15_0)))
		assert(type(arg_15_1) == "number" or type(arg_15_1) == "string", ("bad argument #2 to 'set' (number or string expected, got %s)"):format(type(arg_15_1)))

		local var_15_0

		if var_4_5() then
			var_15_0 = "tbl." .. tostring(var) .. " = " .. var_4_3(arg_15_2, "\t")
		else
			var_15_0 = "tbl[" .. draw_key(arg_15_1) .. "] = " .. var_4_3(arg_15_2, "\t")
		end

		var_4_0.mkpath(arg_15_0)

		local var_15_1 = io.open(arg_15_0, "a+")

		if var_15_1 then
			var_15_1:write(var_15_0 .. "\n")
			var_15_1:close()

			return true
		else
			return false
		end
	end

	function var_4_0.mkpath(arg_16_0)
		assert(type(arg_16_0) == "string", ("bad argument #1 to 'mkpath' (string expected, got %s)"):format(type(arg_16_0)))

		local var_16_0 = package.config:sub(1, 1)
		local var_16_1 = ""

		for iter_16_0 in (arg_16_0:match("(.+" .. var_16_0 .. ").+$") or arg_16_0):gmatch("[^" .. var_16_0 .. "]+") do
			var_16_1 = var_16_1 .. iter_16_0 .. var_16_0

			createDirectory(var_16_1)
		end
	end

	function var_4_0.update(arg_17_0, arg_17_1, arg_17_2)
		assert(type(arg_17_0) == "table", ("bad argument #1 to 'update' (table expected, got %s)"):format(type(arg_17_0)))
		assert(type(arg_17_1) == "string" or type(arg_17_1) == "table", ("bad argument #2 to 'update' (string or table expected, got %s)"):format(type(arg_17_1)))

		if arg_17_2 == nil then
			arg_17_2 = true
		end

		if type(arg_17_1) == "table" then
			if arg_17_2 then
				for iter_17_0, iter_17_1 in pairs(arg_17_1) do
					arg_17_0[iter_17_0] = iter_17_1
				end
			else
				for iter_17_2, iter_17_3 in pairs(arg_17_1) do
					if not arg_17_0[iter_17_2] then
						arg_17_0[iter_17_2] = iter_17_3
					end
				end
			end

			return true
		elseif type(arg_17_1) == "string" then
			local var_17_0 = var_4_0.load(arg_17_1)

			if var_17_0 then
				if arg_17_2 then
					for iter_17_4, iter_17_5 in pairs(var_17_0) do
						arg_17_0[iter_17_4] = iter_17_5
					end
				else
					for iter_17_6, iter_17_7 in pairs(var_17_0) do
						if not arg_17_0[iter_17_6] then
							arg_17_0[iter_17_6] = iter_17_7
						end
					end
				end

				return true
			end
		end

		return false
	end

	return var_4_0
end

local var_0_0 = {
	_VERSION = "3.0.0",
	_AUTHOR = "Double Tap Inside",
	_EMAIL = "double.tap.inside@gmail.com",
	__init = function()
		local var_18_0 = {}

		local function var_18_1(arg_19_0)
			return string.format("%q", arg_19_0)
		end

		local function var_18_2(arg_20_0)
			if type(arg_20_0) == "string" and arg_20_0:match("^[_%a][_%a%d]*$") then
				return true
			else
				return false
			end
		end

		local function var_18_3(arg_21_0)
			if type(arg_21_0) == "string" and arg_21_0:match("^[_%a][_%a%d]*$") then
				return arg_21_0
			end
		end

		local function var_18_4(arg_22_0)
			if type(arg_22_0) == "string" then
				return var_18_1(arg_22_0)
			elseif type(arg_22_0) == "number" then
				return tostring(arg_22_0)
			end
		end

		local function var_18_5(arg_23_0)
			if var_18_2(arg_23_0) then
				return arg_23_0
			else
				return "[" .. var_18_4(arg_23_0) .. "]"
			end
		end

		local function var_18_6(arg_24_0, arg_24_1)
			local var_24_0 = arg_24_1 or ""
			local var_24_1 = {}

			for iter_24_0, iter_24_1 in pairs(arg_24_0) do
				if type(iter_24_1) == "string" then
					if type(iter_24_0) == "number" and iter_24_0 <= #arg_24_0 then
						table.insert(var_24_1, var_18_1(iter_24_1))
					else
						table.insert(var_24_1, var_18_5(iter_24_0) .. " = " .. var_18_1(iter_24_1))
					end
				elseif type(iter_24_1) == "number" or type(iter_24_1) == "boolean" then
					if type(iter_24_0) == "number" and iter_24_0 <= #arg_24_0 then
						table.insert(var_24_1, tostring(iter_24_1))
					else
						table.insert(var_24_1, var_18_5(iter_24_0) .. " = " .. tostring(iter_24_1))
					end
				elseif type(iter_24_1) == "table" then
					if type(iter_24_0) == "number" and iter_24_0 <= #arg_24_0 then
						table.insert(var_24_1, var_18_6(iter_24_1, var_24_0 .. "\t"))
					else
						table.insert(var_24_1, var_18_5(iter_24_0) .. " = " .. var_18_6(iter_24_1, var_24_0 .. "\t"))
					end
				elseif type(iter_24_0) == "number" and iter_24_0 <= #arg_24_0 then
					table.insert(var_24_1, var_18_1(tostring(iter_24_1)))
				else
					table.insert(var_24_1, var_18_5(iter_24_0) .. " = " .. var_18_1(tostring(iter_24_1)))
				end
			end

			if #var_24_1 == 0 and var_24_0 == "" then
				return ""
			elseif #var_24_1 == 0 then
				return "{}"
			elseif var_24_0 == "" then
				return table.concat(var_24_1, ",\n") .. ",\n"
			else
				return "{\n" .. var_24_0 .. table.concat(var_24_1, ",\n" .. var_24_0) .. ",\n" .. var_24_0:sub(2) .. "}"
			end
		end

		local function var_18_7(arg_25_0, arg_25_1)
			if type(arg_25_0) == "string" then
				return var_18_1(arg_25_0)
			elseif type(arg_25_0) == "number" or type(arg_25_0) == "boolean" or type(arg_25_0) == "nil" then
				return tostring(arg_25_0)
			elseif type(arg_25_0) == "table" then
				return var_18_6(arg_25_0, arg_25_1)
			else
				return var_18_1(tostring(arg_25_0))
			end
		end

		local function var_18_8(arg_26_0)
			local var_26_0 = {}

			for iter_26_0, iter_26_1 in pairs(arg_26_0) do
				if type(iter_26_0) == "number" then
					table.insert(var_26_0, "table.insert(tbl, " .. var_18_7(iter_26_1, "\t") .. ")")
				elseif type(iter_26_0) == "string" then
					if var_18_2(iter_26_0) then
						table.insert(var_26_0, "tbl." .. var_18_3(iter_26_0) .. " = " .. var_18_7(iter_26_1, "\t"))
					else
						table.insert(var_26_0, "tbl[" .. var_18_1(iter_26_0) .. "] = " .. var_18_7(iter_26_1, "\t"))
					end
				end
			end

			if #var_26_0 == 0 then
				return ""
			else
				return table.concat(var_26_0, "\n") .. "\n"
			end
		end

		function var_18_0.table_load(arg_27_0, arg_27_1)
			assert(type(arg_27_0) == "string", ("bad argument #1 to 'load' (string expected, got %s)"):format(type(arg_27_0)))

			local var_27_0 = io.open(arg_27_0, "r")

			if var_27_0 then
				local var_27_1 = var_27_0:read("*all")

				var_27_0:close()

				local var_27_2 = loadstring("local tbl = {}\n" .. var_27_1 .. "\nreturn tbl")

				if var_27_2 then
					local var_27_3 = var_27_2()

					if type(var_27_3) == "table" then
						if arg_27_1 then
							var_18_0.table_save(arg_27_0, var_27_3)
						end

						return var_27_3
					end
				end
			end
		end

		function var_18_0.table_save(arg_28_0, arg_28_1)
			assert(type(arg_28_0) == "string", ("bad argument #1 to 'table_save' (string expected, got %s)"):format(type(arg_28_0)))
			assert(type(arg_28_1) == "table", ("bad argument #2 to 'table_save' (table expected, got %s)"):format(type(arg_28_1)))
			var_18_0.mkpath(arg_28_0)

			local var_28_0 = io.open(arg_28_0, "w+")

			if var_28_0 then
				local var_28_1 = var_18_8(arg_28_1)

				var_28_0:write(var_28_1)
				var_28_0:close()

				return true
			else
				return false
			end
		end

		function var_18_0.table_insert(arg_29_0, arg_29_1, arg_29_2)
			assert(type(arg_29_0) == "string", ("bad argument #1 to 'table_insert' (string expected, got %s)"):format(type(arg_29_0)))

			if arg_29_2 then
				assert(type(arg_29_1) == "number", ("bad argument #2 to 'table_insert' (number expected, got %s)"):format(type(arg_29_1)))
			end

			local var_29_0

			if arg_29_2 then
				var_29_0 = "table.insert(tbl, " .. arg_29_1 .. ", " .. var_18_7(arg_29_2, "\t") .. ")"
			else
				var_29_0 = "table.insert(tbl, " .. var_18_7(arg_29_1, "\t") .. ")"
			end

			var_18_0.mkpath(arg_29_0)

			local var_29_1 = io.open(arg_29_0, "a+")

			if var_29_1 then
				var_29_1:write(var_29_0 .. "\n")
				var_29_1:close()

				return true
			else
				return false
			end
		end

		function var_18_0.table_remove(arg_30_0, arg_30_1)
			assert(type(arg_30_0) == "string", ("bad argument #1 to 'table_remove' (string expected, got %s)"):format(type(arg_30_0)))
			assert(type(arg_30_1) == "number" or arg_30_1 == nil, ("bad argument #2 to 'table_remove' (number or nil expected, got %s)"):format(type(arg_30_1)))

			local var_30_0

			if arg_30_1 then
				var_30_0 = "table.remove(tbl, " .. arg_30_1 .. ")"
			else
				var_30_0 = "table.remove(tbl)"
			end

			var_18_0.mkpath(arg_30_0)

			local var_30_1 = io.open(arg_30_0, "a+")

			if var_30_1 then
				var_30_1:write(var_30_0 .. "\n")
				var_30_1:close()

				return true
			else
				return false
			end
		end

		function var_18_0.table_set(arg_31_0, arg_31_1, arg_31_2)
			assert(type(arg_31_0) == "string", ("bad argument #1 to 'table_set' (string expected, got %s)"):format(type(arg_31_0)))
			assert(type(arg_31_1) == "number" or type(arg_31_1) == "string", ("bad argument #2 to 'table_set' (number or string expected, got %s)"):format(type(arg_31_1)))

			local var_31_0 = var_18_3(arg_31_1)
			local var_31_1

			if var_31_0 then
				var_31_1 = "tbl." .. var_31_0 .. " = " .. var_18_7(arg_31_2, "\t")
			else
				var_31_1 = "tbl[" .. var_18_4(arg_31_1) .. "] = " .. var_18_7(arg_31_2, "\t")
			end

			var_18_0.mkpath(arg_31_0)

			local var_31_2 = io.open(arg_31_0, "a+")

			if var_31_2 then
				var_31_2:write(var_31_1 .. "\n")
				var_31_2:close()

				return true
			else
				return false
			end
		end

		function var_18_0.mkpath(arg_32_0)
			assert(type(arg_32_0) == "string", ("bad argument #1 to 'mkpath' (string expected, got %s)"):format(type(arg_32_0)))

			local var_32_0 = package.config:sub(1, 1)
			local var_32_1 = ""

			for iter_32_0 in (arg_32_0:match("(.+" .. var_32_0 .. ").+$") or arg_32_0):gmatch("[^" .. var_32_0 .. "]+") do
				var_32_1 = var_32_1 .. iter_32_0 .. var_32_0

				createDirectory(var_32_1)
			end
		end

		function var_18_0.load(arg_33_0, arg_33_1)
			assert(type(arg_33_0) == "string", ("bad argument #1 to 'load' (string expected, got %s)"):format(type(arg_33_0)))

			local var_33_0 = io.open(arg_33_0, "r")

			if var_33_0 then
				local var_33_1 = var_33_0:read("*all")

				var_33_0:close()

				local var_33_2 = loadstring("return {" .. var_33_1 .. "}")

				if var_33_2 then
					local var_33_3 = var_33_2()

					if type(var_33_3) == "table" then
						if arg_33_1 then
							var_18_0.save(arg_33_0, var_33_3)
						end

						return var_33_3
					end
				end
			end
		end

		function var_18_0.save(arg_34_0, arg_34_1)
			assert(type(arg_34_0) == "string", ("bad argument #1 to 'save' (string expected, got %s)"):format(type(arg_34_0)))
			assert(type(arg_34_1) == "table", ("bad argument #2 to 'save' (table expected, got %s)"):format(type(arg_34_1)))
			var_18_0.mkpath(arg_34_0)

			local var_34_0 = io.open(arg_34_0, "w+")

			if var_34_0 then
				local var_34_1 = var_18_6(arg_34_1)

				var_34_0:write(var_34_1)
				var_34_0:close()

				return true
			else
				return false
			end
		end

		function var_18_0.append(arg_35_0, arg_35_1)
			assert(type(arg_35_0) == "string", ("bad argument #1 to 'append' (string expected, got %s)"):format(type(arg_35_0)))
			var_18_0.mkpath(arg_35_0)

			local var_35_0 = io.open(arg_35_0, "a+")

			if var_35_0 then
				var_35_0:write(var_18_7(arg_35_1, "\t") .. ",\n")
				var_35_0:close()

				return true
			else
				return false
			end
		end

		function var_18_0.set(arg_36_0, arg_36_1, arg_36_2)
			assert(type(arg_36_0) == "string", ("bad argument #1 to 'set' (string expected, got %s)"):format(type(arg_36_0)))
			assert(type(arg_36_1) == "string" or type(arg_36_1) == "number", ("bad argument #2 to 'set' (string or number expected, got %s)"):format(type(arg_36_1)))
			var_18_0.mkpath(arg_36_0)

			local var_36_0 = io.open(arg_36_0, "a+")

			if var_36_0 then
				var_36_0:write("\n" .. var_18_5(arg_36_1) .. " = " .. var_18_7(arg_36_2) .. ",")
				var_36_0:close()

				return true
			else
				return false
			end
		end

		function var_18_0.update(arg_37_0, arg_37_1, arg_37_2)
			assert(type(arg_37_0) == "table", ("bad argument #1 to 'update' (table expected, got %s)"):format(type(arg_37_0)))
			assert(type(arg_37_1) == "string" or type(arg_37_1) == "table", ("bad argument #2 to 'update' (string or table expected, got %s)"):format(type(arg_37_1)))

			if arg_37_2 == nil then
				arg_37_2 = true
			end

			if type(arg_37_1) == "table" then
				if arg_37_2 then
					for iter_37_0, iter_37_1 in pairs(arg_37_1) do
						arg_37_0[iter_37_0] = iter_37_1
					end
				else
					for iter_37_2, iter_37_3 in pairs(arg_37_1) do
						if not arg_37_0[iter_37_2] then
							arg_37_0[iter_37_2] = iter_37_3
						end
					end
				end

				return true
			elseif type(arg_37_1) == "string" then
				local var_37_0 = var_18_0.load(arg_37_1)

				if var_37_0 then
					if arg_37_2 then
						for iter_37_4, iter_37_5 in pairs(var_37_0) do
							arg_37_0[iter_37_4] = iter_37_5
						end
					else
						for iter_37_6, iter_37_7 in pairs(var_37_0) do
							if not arg_37_0[iter_37_6] then
								arg_37_0[iter_37_6] = iter_37_7
							end
						end
					end

					return true
				end
			end

			return false
		end

		return var_18_0
	end
}

setmetatable(var_0_0, {
	__call = function(arg_38_0)
		return arg_38_0.__init()
	end
})

ecfg = var_0_0()
fa = require("fAwesome5")
game_keys = require("game.keys")
wm = require("lib.windows.message")
vector3d = require("vector3d")

addEventHandler("onWindowMessage", function(arg_39_0, arg_39_1, arg_39_2)

	if arg_39_0 == wm.WM_KEYDOWN or arg_39_0 == wm.WM_KEYUP or arg_39_0 == wm.WM_CHAR then
		if arg_39_1 == VK_ESCAPE and img.window_info_dialg.v and not sampIsChatInputActive() and not isSampfuncsConsoleActive() and not sampIsScoreboardOpen() then
			if arg_39_0 == wm.WM_KEYUP then
				sampSetDialogClientside(true)
				sampCloseCurrentDialogWithButton(0)

				img.window_info_dialg.v = false

				local var_39_0 = u8:decode(img.info_dialog_buffer.v)

				sampSendDialogResponse(info_dialog.id, 0, -1, var_39_0)
				sampev.onSendDialogResponse(info_dialog.id, 0, -1, var_39_0)
			end

			consumeWindowMessage(true, true)
		end

		if arg_39_1 == VK_RETURN and img.window_info_dialg.v and not sampIsChatInputActive() and not isSampfuncsConsoleActive() and not sampIsScoreboardOpen() then
			if arg_39_0 == wm.WM_KEYUP then
				sampSetDialogClientside(true)
				sampCloseCurrentDialogWithButton(1)

				img.window_info_dialg.v = false

				local var_39_1

				if DIALOG_STYLE_INPUT == info_dialog.style then
					var_39_1 = u8:decode(img.info_dialog_buffer.v)
				end

				sampSendDialogResponse(info_dialog.id, 1, -1, var_39_1)
				sampev.onSendDialogResponse(info_dialog.id, 1, -1, var_39_1)
			end

			consumeWindowMessage(true, true)
		end
	end
end)

function shiftCameraByPixelsOffset(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0, var_40_1 = convert3DCoordsToScreen(getActiveCameraPointAt())
	local var_40_2 = vector3d(getActiveCameraCoordinates()) - vector3d(convertScreenCoordsToWorld3D(var_40_0 + arg_40_0, var_40_1 + arg_40_1, 50))
	local var_40_3 = math.atan2(var_40_2.y, var_40_2.x)
	local var_40_4 = math.atan2(math.sqrt(var_40_2.x^2 + var_40_2.y^2), var_40_2.z) - math.pi / 2

	setCameraPositionUnfixed(arg_40_2 or var_40_4, var_40_3)
end

local var_0_1 = require("memory")

function patchWheelRotation(arg_41_0)
	if arg_41_0 then
		for iter_41_0 = 1, 6 do
			var_0_1.setint8(7003425 + iter_41_0, 144, true)
		end
	else
		for iter_41_1, iter_41_2 in ipairs({
			137,
			142,
			148,
			4,
			0,
			0
		}) do
			var_0_1.setint8(7003425 + iter_41_1, iter_41_2, true)
		end
	end
end

function getWheelRotationAngle(arg_42_0)
	if doesVehicleExist(arg_42_0) then
		return var_0_1.getfloat(getCarPointer(arg_42_0) + 1172, true)
	end
end

function setWheelRotationAngle(arg_43_0, arg_43_1)
	if doesVehicleExist(arg_43_0) then
		return var_0_1.setfloat(getCarPointer(arg_43_0) + 1172, arg_43_1, true)
	end
end

effil = require("effil")
dkjson = require("dkjson")

function requestRunner()
	return effil.thread(function(arg_45_0, arg_45_1, arg_45_2)
		local var_45_0 = require("requests")
		local var_45_1 = require("dkjson")
		local var_45_2, var_45_3 = pcall(var_45_0.request, arg_45_0, arg_45_1, var_45_1.decode(arg_45_2))

		if var_45_2 then
			var_45_3.json, var_45_3.xml = nil

			return true, var_45_3
		else
			return false, var_45_3
		end
	end)
end

function handleAsyncHttpRequestThread(arg_46_0, arg_46_1, arg_46_2)
	local var_46_0
	local var_46_1

	repeat
		var_46_0, var_46_1 = arg_46_0:status()

		wait(0)
	until var_46_0 ~= "running"

	if not var_46_1 then
		if var_46_0 == "completed" then
			local var_46_2, var_46_3 = arg_46_0:get()

			if var_46_2 then
				arg_46_1(var_46_3)
			else
				arg_46_2(var_46_3)
			end

			return
		elseif var_46_0 == "canceled" then
			return arg_46_2(var_46_0)
		end
	else
		return arg_46_2(var_46_1)
	end
end

function asyncHttpRequest(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4)
	local var_47_0 = requestRunner()(arg_47_0, arg_47_1, encodeJson(arg_47_2, true))

	arg_47_3 = arg_47_3 or function()
		return
	end
	arg_47_4 = arg_47_4 or function()
		return
	end

	return {
		effilRequestThread = var_47_0,
		luaHttpHandleThread = lua_thread.create(handleAsyncHttpRequestThread, var_47_0, arg_47_3, arg_47_4)
	}
end

require("sampfuncs")
require("moonloader")

dlstatus = require("moonloader").download_status
FONT = renderCreateFont("Arial", 12, FCR_BOLD)
encoding = require("encoding")
encoding.default = "CP1251"
u8 = encoding.UTF8
https = require("ssl.https")
sampev = require("lib.samp.events")
requests = require("requests")
lfs = require("lfs")
imgui = require("imgui")

function imgui.ButtonActivated(arg_50_0, ...)
	if arg_50_0 then
		imgui.PushStyleColor(imgui.Col.Button, imgui.GetStyle().Colors[imgui.Col.Header])
		imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.GetStyle().Colors[imgui.Col.HeaderHovered])
		imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.GetStyle().Colors[imgui.Col.HeaderActive])
		imgui.Button(...)
		imgui.PopStyleColor(3)
	else
		imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0, 0, 0, 0))
		imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.GetStyle().Colors[imgui.Col.HeaderHovered])
		imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.GetStyle().Colors[imgui.Col.HeaderActive])

		local var_50_0 = imgui.Button(...)

		imgui.PopStyleColor(3)

		return var_50_0
	end
end

function imgui.ButtonSelectable(arg_51_0, arg_51_1, ...)
	if not arg_51_0 then
		local var_51_0 = imgui.ImVec4(0, 0, 0, 0)

		imgui.PushStyleColor(imgui.Col.Button, var_51_0)
		imgui.PushStyleColor(imgui.Col.ButtonHovered, var_51_0)
		imgui.PushStyleColor(imgui.Col.ButtonActive, var_51_0)
		imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
		imgui.Button(...)
		imgui.PopStyleColor(4)
	elseif arg_51_1 then
		imgui.PushStyleColor(imgui.Col.Button, imgui.GetStyle().Colors[imgui.Col.Header])
		imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.GetStyle().Colors[imgui.Col.Header])

		local var_51_1 = imgui.Button(...)

		imgui.PopStyleColor(2)

		return var_51_1
	else
		local var_51_2 = imgui.ImVec4(0, 0, 0, 0)

		imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0, 0, 0, 0))
		imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.GetStyle().Colors[imgui.Col.HeaderHovered])
		imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.GetStyle().Colors[imgui.Col.HeaderHovered])

		local var_51_3 = imgui.Button(...)

		imgui.PopStyleColor(3)

		return var_51_3
	end
end

function imgui.SelectableEx(arg_52_0, arg_52_1, arg_52_2, ...)
	if not arg_52_0 then
		local var_52_0 = imgui.ImVec4(0, 0, 0, 0)

		imgui.PushStyleColor(imgui.Col.Header, var_52_0)
		imgui.PushStyleColor(imgui.Col.HeaderHovered, var_52_0)
		imgui.PushStyleColor(imgui.Col.HeaderActive, var_52_0)
		imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
		imgui.Selectable(arg_52_1, arg_52_2, ...)
		imgui.PopStyleColor(4)
	elseif arg_52_2 then
		imgui.PushStyleColor(imgui.Col.HeaderHovered, imgui.GetStyle().Colors[imgui.Col.Header])
		imgui.PushStyleColor(imgui.Col.HeaderActive, imgui.GetStyle().Colors[imgui.Col.Header])

		local var_52_1 = imgui.Selectable(arg_52_1, arg_52_2, ...)

		imgui.PopStyleColor(2)

		return var_52_1
	else
		return imgui.Selectable(arg_52_1, arg_52_2, ...)
	end
end

function imgui.ButtonCheckbox(arg_53_0, ...)
	if arg_53_0 then
		imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.35, 0.2, 0.24, 1))
		imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(0.45, 0.25, 0.29, 1))
		imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(0.45, 0.25, 0.29, 1))

		local var_53_0 = imgui.Button(...)

		imgui.PopStyleColor(3)

		return var_53_0
	else
		return imgui.Button(...)
	end
end

function imgui.TextQuestion(arg_54_0, arg_54_1)
	imgui.Text(arg_54_0)

	if not sell_current_moving_item and not buy_current_moving_item and imgui.IsItemHovered() then
		imgui.BeginTooltip()
		imgui.TextUnformatted(arg_54_1)
		imgui.EndTooltip()
	end
end

function imgui.ButtonRed(arg_55_0, ...)
	local var_55_0

	if arg_55_0 then
		imgui.PushStyleColor(imgui.Col.Button, tmp.color_red)
		imgui.PushStyleColor(imgui.Col.ButtonHovered, tmp.color_red_hovered)
		imgui.PushStyleColor(imgui.Col.ButtonActive, tmp.color_red_active)

		var_55_0 = imgui.Button(...)

		imgui.PopStyleColor(3)
	else
		var_55_0 = imgui.Button(...)
	end

	return var_55_0
end

imgui.Link = {}

setmetatable(imgui.Link, {
	__call = function(arg_56_0, arg_56_1)
		local var_56_0 = imgui.CalcTextSize(arg_56_1)
		local var_56_1 = imgui.GetCursorScreenPos()
		local var_56_2 = imgui.GetCursorPos()

		imgui.TextColored(imgui.ImVec4(0, 0, 0, 0), arg_56_1)
		imgui.SetCursorPos(var_56_2)

		if imgui.IsItemHovered() then
			imgui.TextColored(imgui.GetStyle().Colors[imgui.Col.Text], arg_56_1)
			imgui.GetWindowDrawList():AddLine(imgui.ImVec2(var_56_1.x, var_56_1.y + var_56_0.y), imgui.ImVec2(var_56_1.x + var_56_0.x, var_56_1.y + var_56_0.y), imgui.GetColorU32(imgui.GetStyle().Colors[imgui.Col.Text]))
		else
			imgui.TextColored(imgui.GetStyle().Colors[imgui.Col.Text], arg_56_1)
		end

		return result
	end
})

imgui.ClickNotif = {}

setmetatable(imgui.ClickNotif, {
	__call = function(arg_57_0, arg_57_1, arg_57_2, arg_57_3)
		if arg_57_1 then
			arg_57_0._clock = os.clock()
			arg_57_0._last_text = arg_57_2
		end

		if arg_57_0._clock then
			if imgui.IsItemHovered() and arg_57_2 == arg_57_0._last_text then
				local var_57_0 = arg_57_3 or 1500

				if os.clock() - arg_57_0._clock < var_57_0 / 1000 then
					imgui.PushStyleColor(imgui.Col.PopupBg, imgui.GetStyle().Colors[imgui.Col.TextSelectedBg])
					imgui.BeginTooltip()
					imgui.Text(arg_57_2:gsub("##.-$", ""))
					imgui.EndTooltip()
					imgui.PopStyleColor()
				else
					arg_57_0._clock = nil
				end
			elseif arg_57_2 == arg_57_0._last_text then
				arg_57_0._clock = nil
			end
		end
	end
})

imgui.TNotif = {
	_notifs = {}
}

function imgui.TNotif.add(arg_58_0, arg_58_1)
	table.insert(imgui.TNotif._notifs, {
		text = arg_58_0,
		timeout = arg_58_1 or 1500,
		started = os.clock()
	})
end

function imgui.TNotif.click(arg_59_0, arg_59_1)
	imgui.TNotif._clicknotif = {
		text = arg_59_0,
		timeout = arg_59_1 or 1500,
		started = os.clock()
	}
end

function imgui.TNotif.clear()
	imgui.TNotif._notifs = {}
end

function imgui.TNotif.draw()
	if imgui.TNotif._clicknotif then
		imgui.PushStyleColor(imgui.Col.PopupBg, imgui.GetStyle().Colors[imgui.Col.TextSelectedBg])
		imgui.BeginTooltip()
		imgui.Text(imgui.TNotif._clicknotif.text)

		if os.clock() - imgui.TNotif._clicknotif.started > imgui.TNotif._clicknotif.timeout / 1000 or not imgui.IsAnyItemHovered() then
			imgui.TNotif._clicknotif = nil
		end

		imgui.EndTooltip()
		imgui.PopStyleColor()
	else
		local var_61_0 = false

		for iter_61_0, iter_61_1 in ipairs(imgui.TNotif._notifs) do
			imgui.PushStyleColor(imgui.Col.PopupBg, imgui.GetStyle().Colors[imgui.Col.TextSelectedBg])
			imgui.BeginTooltip()
			imgui.Text(iter_61_1.text)

			if iter_61_0 ~= #imgui.TNotif._notifs then
				imgui.Separator()
			end

			if os.clock() - iter_61_1.started < iter_61_1.timeout / 1000 then
				var_61_0 = true
			end

			imgui.EndTooltip()
			imgui.PopStyleColor()
		end

		if not var_61_0 then
			imgui.TNotif.clear()
		end
	end
end

imgui.Link2 = {}

setmetatable(imgui.Link2, {
	__call = function(arg_62_0, arg_62_1, arg_62_2, arg_62_3, arg_62_4)
		local var_62_0 = arg_62_4 or 1500
		local var_62_1 = imgui.CalcTextSize(arg_62_1)
		local var_62_2 = imgui.GetCursorScreenPos()
		local var_62_3 = imgui.GetCursorPos()
		local var_62_4 = imgui.InvisibleButton(arg_62_1, var_62_1)

		if arg_62_3 then
			if var_62_4 then
				arg_62_0._clock = os.clock()
				arg_62_0._last_label = arg_62_1
			end

			if imgui.IsItemHovered() and arg_62_1 == arg_62_0._last_label then
				if arg_62_0._clock then
					if os.clock() - arg_62_0._clock < var_62_0 / 1000 then
						imgui.PushStyleColor(imgui.Col.PopupBg, imgui.GetStyle().Colors[imgui.Col.TextSelectedBg])
						imgui.BeginTooltip()
						imgui.Text(arg_62_3)
						imgui.EndTooltip()
						imgui.PopStyleColor()
					else
						arg_62_0._clock = nil
					end
				else
					arg_62_0._clock = nil
				end
			elseif arg_62_1 == arg_62_0._last_label then
				arg_62_0._clock = nil
			end
		end

		imgui.SetCursorPos(var_62_3)

		if imgui.IsItemHovered() then
			if arg_62_2 then
				imgui.BeginTooltip()
				imgui.PushTextWrapPos(600)
				imgui.TextUnformatted(arg_62_2)
				imgui.PopTextWrapPos()
				imgui.EndTooltip()
			end

			imgui.TextColored(imgui.GetStyle().Colors[imgui.Col.Text], arg_62_1:gsub("##.+$", ""))
		else
			imgui.TextColored(imgui.GetStyle().Colors[imgui.Col.TextDisabled], arg_62_1:gsub("##.+$", ""))
		end

		return var_62_4
	end
})

imgui.InputIntEx = {
	_edited_item = {}
}

setmetatable(imgui.InputIntEx, {
	__call = function(arg_63_0, arg_63_1, ...)
		if imgui.InputInt(arg_63_1, ...) or imgui.IsItemActive() then
			imgui.InputIntEx._edited_item[arg_63_1] = true
		end

		if not imgui.IsItemActive() and imgui.InputIntEx._edited_item[arg_63_1] then
			imgui.InputIntEx._edited_item[arg_63_1] = nil

			return true
		end
	end
})

imgui.InputTextEx = {
	_edited_item = {}
}

setmetatable(imgui.InputTextEx, {
	__call = function(arg_64_0, arg_64_1, ...)
		if imgui.InputText(arg_64_1, ...) or imgui.IsItemActive() then
			imgui.InputTextEx._edited_item[arg_64_1] = true
		end

		if not imgui.IsItemActive() and imgui.InputTextEx._edited_item[arg_64_1] then
			imgui.InputTextEx._edited_item[arg_64_1] = nil

			return true
		end
	end
})

function imgui.InputTextWithHint(arg_65_0, arg_65_1, arg_65_2, arg_65_3, arg_65_4, arg_65_5)
	local var_65_0 = {
		imgui.GetCursorPos(),
		0
	}
	local var_65_1 = imgui.InputText(arg_65_0, arg_65_2, arg_65_3, arg_65_4, arg_65_5)

	var_65_0[2] = imgui.GetCursorPos()

	local var_65_2 = type(arg_65_1) == "string" and arg_65_2.v:len() < 1 and arg_65_1 or "\x00"
	local var_65_3 = imgui.CalcTextSize(var_65_2).x
	local var_65_4 = imgui.CalcTextSize("A").x

	imgui.SetCursorPos(imgui.ImVec2(var_65_0[1].x + 8, var_65_0[1].y + 2))
	imgui.TextDisabled(imgui.CalcItemWidth() and var_65_3 > imgui.CalcItemWidth() and var_65_2:sub(1, math.floor(imgui.CalcItemWidth() / var_65_4)) or var_65_2)
	imgui.SetCursorPos(var_65_0[2])

	return var_65_1
end

function imgui.ButtonOrange(...)
	imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.67, 0.2, 0, 1))
	imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(0.67, 0.2, 0, 1))
	imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(0.67, 0.2, 0, 1))

	local var_66_0 = imgui.Button(...)

	imgui.PopStyleColor(3)

	return var_66_0
end

function imgui.ButtonClickable(arg_67_0, ...)
	if arg_67_0 then
		return imgui.Button(...)
	else
		local var_67_0, var_67_1, var_67_2, var_67_3 = imgui.ImColor(imgui.GetStyle().Colors[imgui.Col.Button]):GetFloat4()

		imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(var_67_0, var_67_1, var_67_2, var_67_3 / 2))
		imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(var_67_0, var_67_1, var_67_2, var_67_3 / 2))
		imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(var_67_0, var_67_1, var_67_2, var_67_3 / 2))
		imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
		imgui.Button(...)
		imgui.PopStyleColor(4)
	end
end

function imgui.SameLineItemInnerSpacing()
	imgui.PushStyleVar(imgui.StyleVar.ItemSpacing, imgui.GetStyle().ItemInnerSpacing)
	imgui.SameLine()
	imgui.PopStyleVar()
end

function imgui.TextColoredRGB(arg_69_0)
	local var_69_0 = imgui.GetStyle().Colors
	local var_69_1 = imgui.ImVec4

	local function var_69_2(arg_70_0)
		local var_70_0 = bit.band(bit.rshift(arg_70_0, 24), 255)
		local var_70_1 = bit.band(bit.rshift(arg_70_0, 16), 255)
		local var_70_2 = bit.band(bit.rshift(arg_70_0, 8), 255)
		local var_70_3 = bit.band(arg_70_0, 255)

		return var_70_0, var_70_1, var_70_2, var_70_3
	end

	local function var_69_3(arg_71_0)
		if arg_71_0:sub(1, 6):upper() == "SSSSSS" then
			local var_71_0 = var_69_0[1].x
			local var_71_1 = var_69_0[1].y
			local var_71_2 = var_69_0[1].z
			local var_71_3 = tonumber(arg_71_0:sub(7, 8), 16) or var_69_0[1].w * 255

			return var_69_1(var_71_0, var_71_1, var_71_2, var_71_3 / 255)
		end

		local var_71_4 = type(arg_71_0) == "string" and tonumber(arg_71_0, 16) or arg_71_0

		if type(var_71_4) ~= "number" then
			return
		end

		local var_71_5, var_71_6, var_71_7, var_71_8 = var_69_2(var_71_4)

		return imgui.ImColor(var_71_5, var_71_6, var_71_7, var_71_8):GetVec4()
	end

	;(function(arg_72_0)
		for iter_72_0 in arg_72_0:gmatch("[^\r\n]*") do
			local var_72_0 = {}
			local var_72_1 = {}
			local var_72_2 = 1

			iter_72_0 = iter_72_0:gsub("{(......)}", "{%1FF}")

			while iter_72_0:find("{........}") do
				local var_72_3, var_72_4 = iter_72_0:find("{........}")
				local var_72_5 = var_69_3(iter_72_0:sub(var_72_3 + 1, var_72_4 - 1))

				if var_72_5 then
					var_72_0[#var_72_0], var_72_0[#var_72_0 + 1] = iter_72_0:sub(var_72_2, var_72_3 - 1), iter_72_0:sub(var_72_4 + 1, #iter_72_0)
					var_72_1[#var_72_1 + 1] = var_72_5
					var_72_2 = var_72_3
				end

				iter_72_0 = iter_72_0:sub(1, var_72_3 - 1) .. iter_72_0:sub(var_72_4 + 1, #iter_72_0)
			end

			if var_72_0[0] then
				for iter_72_1 = 0, #var_72_0 do
					imgui.TextColored(var_72_1[iter_72_1] or var_69_0[1], var_72_0[iter_72_1])
					imgui.SameLine(nil, 0)
				end
			else
				imgui.Text(iter_72_0)

				if iter_72_0 ~= "" then
					imgui.SameLine(nil, 0)
				end
			end
		end
	end)(arg_69_0)
end

ru = {
	lu_rus = {},
	ul_rus = {},
	lower = function(arg_73_0)
		arg_73_0 = string.lower(arg_73_0)

		local var_73_0 = {}

		for iter_73_0 = 1, #arg_73_0 do
			local var_73_1 = string.sub(arg_73_0, iter_73_0, iter_73_0)

			var_73_0[iter_73_0] = ru.ul_rus[var_73_1] or var_73_1
		end

		return table.concat(var_73_0)
	end,
	upper = function(arg_74_0)
		arg_74_0 = string.upper(arg_74_0)

		local var_74_0 = {}

		for iter_74_0 = 1, #arg_74_0 do
			local var_74_1 = string.sub(arg_74_0, iter_74_0, iter_74_0)

			var_74_0[iter_74_0] = lu_rus[var_74_1] or var_74_1
		end

		return table.concat(var_74_0)
	end
}

local var_0_2 = {}

for iter_0_0 = 192, 223 do
	local var_0_3 = string.char(iter_0_0)
	local var_0_4 = string.char(iter_0_0 + 32)

	ru.ul_rus[var_0_3] = var_0_4
	ru.lu_rus[var_0_4] = var_0_3

	table.insert(var_0_2, var_0_3)
	table.insert(var_0_2, var_0_4)
end

local var_0_5 = string.char(168)
local var_0_6 = string.char(184)

ru.ul_rus[var_0_5] = var_0_6
ru.lu_rus[var_0_6] = var_0_5

table.insert(var_0_2, var_0_5)
table.insert(var_0_2, var_0_6)

ru.a = table.concat(var_0_2)

local var_0_7 = require("bit")

function join_argb(arg_75_0, arg_75_1, arg_75_2, arg_75_3)
	local var_75_0 = arg_75_3
	local var_75_1 = var_0_7.bor(var_75_0, var_0_7.lshift(arg_75_2, 8))
	local var_75_2 = var_0_7.bor(var_75_1, var_0_7.lshift(arg_75_1, 16))

	return (var_0_7.bor(var_75_2, var_0_7.lshift(arg_75_0, 24)))
end

function explode_argb(arg_76_0)
	local var_76_0 = var_0_7.band(var_0_7.rshift(arg_76_0, 24), 255)
	local var_76_1 = var_0_7.band(var_0_7.rshift(arg_76_0, 16), 255)
	local var_76_2 = var_0_7.band(var_0_7.rshift(arg_76_0, 8), 255)
	local var_76_3 = var_0_7.band(arg_76_0, 255)

	return var_76_0, var_76_1, var_76_2, var_76_3
end

local function var_0_8(arg_77_0)
	return var_0_7.band(arg_77_0, 16777215)
end

function ColorAccentsAdapter(arg_78_0)
	local var_78_0, var_78_1, var_78_2, var_78_3 = explode_argb(arg_78_0)

	return {
		a = var_78_0,
		r = var_78_1,
		g = var_78_2,
		b = var_78_3,
		apply_alpha = function(arg_79_0, arg_79_1)
			arg_79_0.a = arg_79_1

			return arg_79_0
		end,
		as_u32 = function(arg_80_0)
			return join_argb(arg_80_0.a, arg_80_0.b, arg_80_0.g, arg_80_0.r)
		end,
		as_vec4 = function(arg_81_0)
			return imgui.ImVec4(arg_81_0.r / 255, arg_81_0.g / 255, arg_81_0.b / 255, arg_81_0.a / 255)
		end,
		as_argb = function(arg_82_0)
			return join_argb(arg_82_0.a, arg_82_0.r, arg_82_0.g, arg_82_0.b)
		end,
		as_rgba = function(arg_83_0)
			return join_argb(arg_83_0.r, arg_83_0.g, arg_83_0.b, arg_83_0.a)
		end,
		as_chat = function(arg_84_0)
			return string.format("%06X", var_0_8(join_argb(arg_84_0.a, arg_84_0.r, arg_84_0.g, arg_84_0.b)))
		end
	}
end

imgui.Scroller = {
	_author = "Double Tap Inside",
	_version = "2023-10-13",
	_ids = {}
}

setmetatable(imgui.Scroller, {
	__call = function(arg_85_0, arg_85_1, arg_85_2, arg_85_3, arg_85_4, arg_85_5)
		arg_85_4 = arg_85_4 or imgui.HoveredFlags.AllowWhenBlockedByActiveItem

		if not imgui.Scroller._ids[arg_85_1] then
			imgui.Scroller._ids[arg_85_1] = {}
		end

		local var_85_0 = imgui.GetScrollY()

		if imgui.IsWindowHovered(arg_85_4) and imgui.IsMouseDown(0) then
			imgui.Scroller._ids[arg_85_1].start_clock = nil
		end

		if imgui.Scroller._ids[arg_85_1].start_clock then
			if arg_85_3 >= (os.clock() - imgui.Scroller._ids[arg_85_1].start_clock) * 1000 then
				local var_85_1 = (os.clock() - imgui.Scroller._ids[arg_85_1].start_clock) * 1000 / arg_85_3
				local var_85_2 = var_85_1 * (2 - var_85_1)
				local var_85_3 = imgui.Scroller._ids[arg_85_1].target_position - imgui.Scroller._ids[arg_85_1].start_position
				local var_85_4 = imgui.Scroller._ids[arg_85_1].start_position + var_85_3 * var_85_2

				if var_85_4 < 0 then
					var_85_4 = 0
					imgui.Scroller._ids[arg_85_1].start_clock = nil
				elseif var_85_4 > imgui.GetScrollMaxY() then
					var_85_4 = imgui.GetScrollMaxY()
					imgui.Scroller._ids[arg_85_1].start_clock = nil
				end

				if var_85_3 > 0 then
					imgui.SetScrollY(math.floor(var_85_4))
				else
					imgui.SetScrollY(math.ceil(var_85_4))
				end
			else
				local var_85_5 = imgui.Scroller._ids[arg_85_1].target_position - imgui.Scroller._ids[arg_85_1].start_position

				imgui.Scroller._ids[arg_85_1].start_clock = nil

				imgui.SetScrollY(imgui.Scroller._ids[arg_85_1].target_position)
			end
		end

		local var_85_6 = imgui.GetIO().MouseWheel

		if var_85_6 ~= 0 and (imgui.IsWindowHovered(arg_85_4) or arg_85_5) then
			local var_85_7 = -var_85_6 * arg_85_2

			if not imgui.Scroller._ids[arg_85_1].start_clock then
				imgui.Scroller._ids[arg_85_1].start_clock = os.clock()
				imgui.Scroller._ids[arg_85_1].start_position = var_85_0
				imgui.Scroller._ids[arg_85_1].target_position = var_85_0 + var_85_7
			else
				imgui.Scroller._ids[arg_85_1].start_clock = os.clock()
				imgui.Scroller._ids[arg_85_1].start_position = var_85_0

				if imgui.Scroller._ids[arg_85_1].start_position < imgui.Scroller._ids[arg_85_1].target_position and var_85_7 > 0 then
					imgui.Scroller._ids[arg_85_1].target_position = imgui.Scroller._ids[arg_85_1].target_position + var_85_7
				elseif imgui.Scroller._ids[arg_85_1].start_position > imgui.Scroller._ids[arg_85_1].target_position and var_85_7 < 0 then
					imgui.Scroller._ids[arg_85_1].target_position = imgui.Scroller._ids[arg_85_1].target_position + var_85_7
				else
					imgui.Scroller._ids[arg_85_1].target_position = var_85_0 + var_85_7
				end
			end
		end
	end
})

imgui.SetWindowPosBegin = {
	_pos = {}
}

setmetatable(imgui.SetWindowPosBegin, {
	__call = function(arg_86_0, arg_86_1, arg_86_2, arg_86_3, arg_86_4, arg_86_5)
		arg_86_0._id = arg_86_1

		if imgui.IsMouseDown(0) and arg_86_0._pos[arg_86_0._id] and arg_86_5 then
			imgui.SetNextWindowPos(imgui.ImVec2(arg_86_0._pos[arg_86_0._id][1], arg_86_0._pos[arg_86_0._id][2]), arg_86_4)
		elseif arg_86_0._pos[arg_86_0._id] then
			imgui.SetNextWindowPos(imgui.ImVec2(arg_86_0._pos[arg_86_0._id][1], arg_86_0._pos[arg_86_0._id][2]), imgui.Cond.Always)

			if arg_86_2 ~= arg_86_0._pos[arg_86_0._id][1] or arg_86_3 ~= arg_86_0._pos[arg_86_0._id][2] then
				return arg_86_0._pos[arg_86_0._id][1], arg_86_0._pos[arg_86_0._id][2]
			end
		else
			imgui.SetNextWindowPos(imgui.ImVec2(arg_86_2, arg_86_3), imgui.Cond.Always)
		end
	end
})

function imgui.SetWindowPosEnd()
	local var_87_0 = imgui.SetWindowPosBegin

	if var_87_0._id and imgui.IsRootWindowOrAnyChildHovered() and imgui.IsMouseDown(0) then
		local var_87_1 = imgui.GetWindowPos()

		if not var_87_0._pos[var_87_0._id] or var_87_0._pos[var_87_0._id][1] ~= var_87_1.x or var_87_0._pos[var_87_0._id][2] ~= var_87_1.y then
			var_87_0._pos[var_87_0._id] = {
				var_87_1.x,
				var_87_1.y
			}
		end
	end
end

function scale(arg_88_0, arg_88_1)
	return math.floor(arg_88_0 * (arg_88_1 / 100))
end

function apply_default_style()
	imgui.SwitchContext()

	local var_89_0 = imgui.GetStyle()
	local var_89_1 = var_89_0.Colors
	local var_89_2 = imgui.Col
	local var_89_3 = imgui.ImVec4
	local var_89_4 = imgui.ImVec2

	var_89_0.WindowPadding = var_89_4(7, 7)
	var_89_0.FramePadding.y = 5
	var_89_0.WindowRounding = 5
	var_89_0.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
	var_89_0.ChildWindowRounding = 2
	var_89_0.FrameRounding = 4
	var_89_0.ItemSpacing = imgui.ImVec2(10, 10)
	var_89_0.ItemInnerSpacing = var_89_4(5, 5)
	var_89_0.ScrollbarSize = 18
	var_89_0.ScrollbarRounding = 0
	var_89_0.GrabMinSize = 8
	var_89_0.GrabRounding = 1
	DefaultStyle = {}
	DefaultStyle.FramePadding = imgui.ImVec2(var_89_0.FramePadding.x, var_89_0.FramePadding.y)
	DefaultStyle.ItemSpacing = imgui.ImVec2(var_89_0.ItemSpacing.x, var_89_0.ItemSpacing.y)
	DefaultStyle.ScrollbarSize = var_89_0.FramePadding.y * 2 + 14
	DefaultStyle.GrabMinSize = DefaultStyle.ScrollbarSize
	var_89_0.FramePadding.x = scale(var_89_0.FramePadding.x, set.scale)
	var_89_0.FramePadding.y = scale(var_89_0.FramePadding.y, set.scale)
	var_89_0.ItemSpacing.y = scale(var_89_0.ItemSpacing.y, set.scale)
	var_89_0.ScrollbarSize = imgui.GetStyle().FramePadding.y * 2 + scale(14, set.scale)
	var_89_0.GrabMinSize = var_89_0.ScrollbarSize
end

function apply_custom_style()
	imgui.SwitchContext()

	local var_90_0 = imgui.GetStyle().Colors
	local var_90_1 = imgui.Col
	local var_90_2 = imgui.ImVec4
	local var_90_3 = imgui.ImVec2

	tmp.color_orange = var_90_2(1, 0.6, 0, 1)
	tmp.color_red = imgui.ImVec4(0.35, 0.2, 0.24, 1)
	tmp.color_red_hovered = imgui.ImVec4(0.45, 0.25, 0.29, 1)
	tmp.color_red_active = tmp.color_red_hovered
	tmp.color_text = var_90_2(0.93, 0.94, 0.96, 1)
	var_90_0[var_90_1.Text] = var_90_2(0.93, 0.94, 0.96, 1)
	var_90_0[var_90_1.TextDisabled] = var_90_2(0.5, 0.5, 0.5, 1)
	var_90_0[var_90_1.TitleBgActive] = var_90_2(0.07, 0.11, 0.13, 0.98)
	var_90_0[var_90_1.TitleBg] = var_90_0[var_90_1.TitleBgActive]
	var_90_0[var_90_1.TitleBgCollapsed] = var_90_2(0, 0, 0, 0.51)
	var_90_0[var_90_1.WindowBg] = var_90_0[var_90_1.TitleBgActive]
	var_90_0[var_90_1.ChildWindowBg] = var_90_2(0.07, 0.11, 0.13, 0)
	var_90_0[var_90_1.PopupBg] = var_90_2(0.09, 0.09, 0.14, 0.98)
	var_90_0[var_90_1.Border] = var_90_2(0.43, 0.43, 0.5, 0.2)
	var_90_0[var_90_1.BorderShadow] = var_90_2(0, 0, 0, 0)
	var_90_0[var_90_1.Separator] = var_90_0[var_90_1.Border]
	var_90_0[var_90_1.SeparatorHovered] = var_90_0[var_90_1.Border]
	var_90_0[var_90_1.SeparatorActive] = var_90_0[var_90_1.Border]
	var_90_0[var_90_1.MenuBarBg] = var_90_2(0.15, 0.18, 0.22, 1)
	var_90_0[var_90_1.CheckMark] = var_90_2(0, 0.5, 0.5, 1)
	var_90_0[var_90_1.SliderGrab] = var_90_2(0.28, 0.56, 1, 1)
	var_90_0[var_90_1.SliderGrabActive] = var_90_2(0.37, 0.61, 1, 1)
	var_90_0[var_90_1.Button] = var_90_2(0.15, 0.2, 0.24, 1)
	var_90_0[var_90_1.ButtonHovered] = var_90_2(0.2, 0.25, 0.29, 1)
	var_90_0[var_90_1.ButtonActive] = var_90_0[var_90_1.ButtonHovered]
	var_90_0[var_90_1.ScrollbarBg] = var_90_2(0.02, 0.02, 0.02, 0.39)
	var_90_0[var_90_1.ScrollbarGrab] = var_90_0[var_90_1.Button]
	var_90_0[var_90_1.ScrollbarGrabHovered] = var_90_0[var_90_1.ButtonHovered]
	var_90_0[var_90_1.ScrollbarGrabActive] = var_90_0[var_90_1.ButtonHovered]
	var_90_0[var_90_1.FrameBg] = var_90_0[var_90_1.Button]
	var_90_0[var_90_1.FrameBgHovered] = var_90_0[var_90_1.ButtonHovered]
	var_90_0[var_90_1.FrameBgActive] = var_90_0[var_90_1.ButtonHovered]
	var_90_0[var_90_1.ComboBg] = var_90_2(0.35, 0.35, 0.35, 1)
	var_90_0[var_90_1.Header] = var_90_2(1, 1, 1, 0.14)
	var_90_0[var_90_1.HeaderHovered] = var_90_2(1, 1, 1, 0.07)
	var_90_0[var_90_1.HeaderActive] = var_90_2(1, 1, 1, 0.07)
	var_90_0[var_90_1.ResizeGrip] = var_90_2(0.26, 0.4, 0.5, 1)
	var_90_0[var_90_1.ResizeGripHovered] = var_90_0[var_90_1.ResizeGrip]
	var_90_0[var_90_1.ResizeGripActive] = var_90_0[var_90_1.ResizeGrip]
	var_90_0[var_90_1.CloseButton] = var_90_2(0.4, 0.39, 0.38, 0.16)
	var_90_0[var_90_1.CloseButtonHovered] = imgui.ImVec4(0.5, 0.25, 0, 1)
	var_90_0[var_90_1.CloseButtonActive] = var_90_0[var_90_1.CloseButtonHovered]
	var_90_0[var_90_1.PlotLines] = var_90_2(0.61, 0.61, 0.61, 1)
	var_90_0[var_90_1.PlotLinesHovered] = var_90_2(1, 0.43, 0.35, 1)
	var_90_0[var_90_1.PlotHistogram] = var_90_2(0.9, 0.7, 0, 1)
	var_90_0[var_90_1.PlotHistogramHovered] = var_90_2(1, 0.6, 0, 1)
	var_90_0[var_90_1.TextSelectedBg] = var_90_2(0, 0.28, 0.28, 1)
	var_90_0[var_90_1.ModalWindowDarkening] = var_90_2(0.2, 0.2, 0.2, 0.35)
end

function apply_old_ver_style()
	imgui.SwitchContext()

	local var_91_0 = imgui.GetStyle().Colors
	local var_91_1 = imgui.Col
	local var_91_2 = imgui.ImVec4
	local var_91_3 = imgui.ImVec2

	tmp.color_orange = var_91_2(1, 0.6, 0, 1)
end

function apply_vip_style()
	imgui.SwitchContext()

	local var_92_0 = imgui.GetStyle().Colors
	local var_92_1 = imgui.Col
	local var_92_2 = imgui.ImVec4

	tmp.color_orange = var_92_2(1, 0.6, 0, 1)
	tmp.color_red = imgui.ImVec4(0.35, 0.2, 0.24, 1)
	tmp.color_red_hovered = imgui.ImVec4(0.45, 0.25, 0.29, 1)
	tmp.color_red_active = tmp.color_red_hovered
	tmp.color_text = var_92_2(0.93, 0.94, 0.96, 1)
	var_92_0[var_92_1.WindowBg] = var_92_2(0.12, 0.12, 0.13, 0.98)
	var_92_0[var_92_1.ChildWindowBg] = var_92_2(0.3, 0.2, 0.39, 0)
	var_92_0[var_92_1.PopupBg] = var_92_2(0.05, 0.05, 0.1, 0.98)
	var_92_0[var_92_1.Border] = var_92_2(0.89, 0.85, 0.92, 0.3)
	var_92_0[var_92_1.BorderShadow] = var_92_2(0, 0, 0, 0)
	var_92_0[var_92_1.FrameBg] = var_92_2(0.3, 0.2, 0.39, 1)
	var_92_0[var_92_1.FrameBgHovered] = var_92_2(0.41, 0.19, 0.63, 0.68)
	var_92_0[var_92_1.FrameBgActive] = var_92_0[var_92_1.FrameBgHovered]
	var_92_0[var_92_1.TitleBg] = var_92_0[var_92_1.WindowBg]
	var_92_0[var_92_1.TitleBgActive] = var_92_0[var_92_1.WindowBg]
	var_92_0[var_92_1.MenuBarBg] = var_92_2(0.3, 0.2, 0.39, 0.57)
	var_92_0[var_92_1.ScrollbarBg] = var_92_2(0.3, 0.2, 0.39, 1)
	var_92_0[var_92_1.ScrollbarGrab] = var_92_2(0.51, 0.29, 0.73, 1)
	var_92_0[var_92_1.ScrollbarGrabHovered] = var_92_2(0.51, 0.29, 0.73, 1)
	var_92_0[var_92_1.ScrollbarGrabActive] = var_92_2(0.51, 0.29, 0.73, 1)
	var_92_0[var_92_1.ComboBg] = var_92_2(0.3, 0.2, 0.39, 1)
	var_92_0[var_92_1.CheckMark] = var_92_2(0.64, 0.33, 0.94, 1)
	var_92_0[var_92_1.SliderGrab] = var_92_2(0.41, 0.19, 0.63, 0)
	var_92_0[var_92_1.SliderGrabActive] = var_92_2(0.41, 0.19, 0.63, 1)
	var_92_0[var_92_1.Button] = var_92_2(0.41, 0.19, 0.63, 0.44)
	var_92_0[var_92_1.ButtonHovered] = var_92_2(0.41, 0.19, 0.63, 0.86)
	var_92_0[var_92_1.ButtonActive] = var_92_2(0.41, 0.19, 0.63, 0.86)
	var_92_0[var_92_1.Header] = var_92_2(0.41, 0.19, 0.63, 0.86)
	var_92_0[var_92_1.HeaderHovered] = var_92_2(0.41, 0.19, 0.63, 0.3)
	var_92_0[var_92_1.HeaderActive] = var_92_0[var_92_1.HeaderHovered]
	var_92_0[var_92_1.ResizeGrip] = var_92_2(0.41, 0.19, 0.63, 1)
	var_92_0[var_92_1.ResizeGripHovered] = var_92_2(0.41, 0.19, 0.63, 1)
	var_92_0[var_92_1.ResizeGripActive] = var_92_2(0.41, 0.19, 0.63, 1)
	var_92_0[var_92_1.CloseButton] = var_92_2(0.8, 0.7, 0.95, 0.59)
	var_92_0[var_92_1.CloseButtonHovered] = var_92_2(0.88, 0.74, 1, 0.59)
	var_92_0[var_92_1.CloseButtonActive] = var_92_2(0.88, 0.85, 0.92, 1)
	var_92_0[var_92_1.PlotLines] = var_92_2(0.89, 0.85, 0.92, 0.63)
	var_92_0[var_92_1.PlotLinesHovered] = var_92_2(0.41, 0.19, 0.63, 1)
	var_92_0[var_92_1.PlotHistogram] = var_92_2(0.89, 0.85, 0.92, 0.63)
	var_92_0[var_92_1.PlotHistogramHovered] = var_92_2(0.41, 0.19, 0.63, 1)
	var_92_0[var_92_1.TextSelectedBg] = var_92_2(0.41, 0.19, 0.63, 0.43)
	var_92_0[var_92_1.ModalWindowDarkening] = var_92_2(0.2, 0.2, 0.2, 0.35)
end

function apply_green_style()
	imgui.SwitchContext()

	local var_93_0 = imgui.GetStyle().Colors
	local var_93_1 = imgui.Col
	local var_93_2 = imgui.ImVec4

	tmp.color_orange = var_93_2(1, 0.6, 0, 1)
	tmp.color_red = var_93_2(0.65, 0.28, 0.05, 1)
	tmp.color_red_hovered = var_93_2(0.7, 0.35, 0.05, 1)
	tmp.color_red_active = tmp.color_red_hovered
	tmp.color_text = var_93_2(0.85, 0.85, 0.65, 1)
	var_93_0[var_93_1.TextDisabled] = var_93_2(0.55, 0.55, 0.4, 1)
	var_93_0[var_93_1.Text] = var_93_2(0.85, 0.85, 0.65, 1)
	var_93_0[var_93_1.WindowBg] = var_93_2(0.02, 0.06, 0.02, 0.97)
	var_93_0[var_93_1.ChildWindowBg] = var_93_2(0.3, 0.2, 0.39, 0)
	var_93_0[var_93_1.PopupBg] = var_93_2(0.06, 0.12, 0.06, 0.97)
	var_93_0[var_93_1.Border] = var_93_2(0.1, 0.4, 0.1, 0.3)
	var_93_0[var_93_1.BorderShadow] = var_93_2(0, 0, 0, 0)
	var_93_0[var_93_1.Button] = var_93_2(0.12, 0.25, 0.12, 1)
	var_93_0[var_93_1.ButtonHovered] = var_93_2(0.15, 0.3, 0.15, 1)
	var_93_0[var_93_1.ButtonActive] = var_93_0[var_93_1.ButtonHovered]
	var_93_0[var_93_1.FrameBg] = var_93_0[var_93_1.Button]
	var_93_0[var_93_1.FrameBgHovered] = var_93_0[var_93_1.ButtonHovered]
	var_93_0[var_93_1.FrameBgActive] = var_93_0[var_93_1.FrameBgHovered]
	var_93_0[var_93_1.TitleBg] = var_93_0[var_93_1.WindowBg]
	var_93_0[var_93_1.TitleBgActive] = var_93_0[var_93_1.WindowBg]
	var_93_0[var_93_1.ScrollbarBg] = var_93_0[var_93_1.WindowBg]
	var_93_0[var_93_1.ScrollbarGrab] = var_93_0[var_93_1.Button]
	var_93_0[var_93_1.ScrollbarGrabHovered] = var_93_0[var_93_1.ButtonActive]
	var_93_0[var_93_1.ScrollbarGrabActive] = var_93_0[var_93_1.ScrollbarGrabHovered]
	var_93_0[var_93_1.ComboBg] = var_93_2(0.3, 0.2, 0.39, 1)
	var_93_0[var_93_1.CheckMark] = var_93_2(0.8, 0.4, 0, 1)
	var_93_0[var_93_1.SliderGrab] = var_93_2(0.41, 0.19, 0.63, 0)
	var_93_0[var_93_1.SliderGrabActive] = var_93_2(0.41, 0.19, 0.63, 1)
	var_93_0[var_93_1.Header] = var_93_0[var_93_1.ButtonActive]
	var_93_0[var_93_1.HeaderHovered] = var_93_0[var_93_1.Button]
	var_93_0[var_93_1.HeaderActive] = var_93_0[var_93_1.HeaderHovered]
	var_93_0[var_93_1.ResizeGrip] = var_93_2(0.7, 0.32, 0.05, 1)
	var_93_0[var_93_1.ResizeGripHovered] = var_93_0[var_93_1.ResizeGrip]
	var_93_0[var_93_1.ResizeGripActive] = var_93_0[var_93_1.ResizeGrip]
	var_93_0[var_93_1.CloseButton] = var_93_0[var_93_1.CheckMark]
	var_93_0[var_93_1.CloseButtonHovered] = var_93_0[var_93_1.CheckMark]
	var_93_0[var_93_1.CloseButtonActive] = var_93_0[var_93_1.CheckMark]
	var_93_0[var_93_1.TextSelectedBg] = var_93_2(0.5, 0.2, 0.05, 1)
	var_93_0[var_93_1.ModalWindowDarkening] = var_93_2(0, 0, 0, 0.45)
end

function imgui.GetFrameHeight()
	return imgui.GetStyle().FramePadding.y * 2 + imgui.GetFontSize()
end

function imgui.GetSelectableHeight()
	return imgui.GetFontSize() + imgui.GetStyle().ItemSpacing.y
end

function deepcopy(arg_96_0, arg_96_1)
	arg_96_1 = arg_96_1 or {}

	local var_96_0 = type(arg_96_0)
	local var_96_1

	if var_96_0 == "table" then
		if arg_96_1[arg_96_0] then
			var_96_1 = arg_96_1[arg_96_0]
		else
			var_96_1 = {}
			arg_96_1[arg_96_0] = var_96_1

			for iter_96_0, iter_96_1 in next, arg_96_0 do
				var_96_1[deepcopy(iter_96_0, arg_96_1)] = deepcopy(iter_96_1, arg_96_1)
			end

			setmetatable(var_96_1, deepcopy(getmetatable(arg_96_0), arg_96_1))
		end
	else
		var_96_1 = arg_96_0
	end

	return var_96_1
end

directory_resources = getWorkingDirectory() .. "\\config\\" .. __name__
filename_set = directory_resources .. "\\set.cfg"
filename_help = directory_resources .. "\\help.cfg"
filename_buy_list = directory_resources .. "\\buy_list.cfg"
filename_auto_number_dict = directory_resources .. "\\auto_number_dict_fixed.cfg"
filename_sell_list = directory_resources .. "\\sell_list.cfg"
filename_sell_number_dict = directory_resources .. "\\sell_number_dict.cfg"
filename_sell_name_dict = directory_resources .. "\\sell_name_dict.cfg"
filename_log = directory_resources .. "\\log.txt"
directory_buy_average = directory_resources .. "\\buy_average"
directory_buy_average_download = directory_resources .. "\\buy_average_download"
directory_sell_average = directory_resources .. "\\sell_average"
filename_upload_task = directory_resources .. "\\upload_task.json"
directory_sell_average_download = directory_resources .. "\\sell_average_download"
directory_sell = directory_resources .. "\\sell"
directory_buy = directory_resources .. "\\buy"
directory_buy_backup = directory_resources .. "\\buy_backup"
directory_sell_backup = directory_resources .. "\\sell_backup"

function safe_server(arg_97_0)
	arg_97_0 = arg_97_0:lower()
	arg_97_0 = arg_97_0:gsub(" ", "-")

	return arg_97_0
end

ahref = "https://arz-wiki.com/action/?action=get_price_kfmh&server="

function save_json(arg_98_0, arg_98_1)
	ecfg.mkpath(arg_98_0)

	local var_98_0 = io.open(arg_98_0, "w+")

	if var_98_0 then
		var_98_0:write(arg_98_1)
		var_98_0:close()

		return true
	else
		return false
	end
end

function day_tonumber(arg_99_0)
	arg_99_0 = arg_99_0:gsub("%-", "")

	return arg_99_0
end

function download_average(arg_100_0, arg_100_1, arg_100_2)
	ecfg.mkpath(arg_100_2)

	local var_100_0 = io.open(arg_100_2, "w+")

	if var_100_0 then
		var_100_0:write("")
		var_100_0:close()
	end

	local var_100_1 = false

	downloadUrlToFile((ahref or "https://arz-wiki.com/action/?action=get_price&server=") .. safe_server(arg_100_1) .. "&type=" .. arg_100_0, arg_100_2, function(arg_101_0, arg_101_1, arg_101_2, arg_101_3)
		if arg_101_1 == dlstatus.STATUS_ENDDOWNLOADDATA then
			var_100_1 = true

			local var_101_0 = io.open(arg_100_2, "r")

			if var_101_0 then
				local var_101_1 = var_101_0:read("*all")

				var_101_0:close()

				local var_101_2 = decodeJson(var_101_1)

				if type(var_101_2) == "table" then
					local var_101_3

					if arg_100_0 == "buy" then
						var_101_3 = buy_average_price
					elseif arg_100_0 == "sell" then
						var_101_3 = sell_average_price
					end

					local var_101_4 = 0

					for iter_101_0, iter_101_1 in pairs(var_101_2) do
						if var_101_3[arg_100_1] and var_101_3[arg_100_1][iter_101_0] and var_101_3[arg_100_1][iter_101_0].list then
							if day_tonumber(iter_101_1.list[1][1]) > day_tonumber(var_101_3[arg_100_1][iter_101_0].list[1][1]) then
								var_101_3[arg_100_1][iter_101_0] = deepcopy(iter_101_1)
								var_101_4 = var_101_4 + 1
							elseif day_tonumber(iter_101_1.list[1][1]) == day_tonumber(var_101_3[arg_100_1][iter_101_0].list[1][1]) and iter_101_1.list[1][2] > var_101_3[arg_100_1][iter_101_0].list[1][2] then
								var_101_3[arg_100_1][iter_101_0] = deepcopy(iter_101_1)
								var_101_4 = var_101_4 + 1
							end
						elseif type(iter_101_1) == "table" and iter_101_1.list and iter_101_1.update_time then
							var_101_3[arg_100_1] = var_101_3[arg_100_1] or {}
							var_101_3[arg_100_1][iter_101_0] = deepcopy(iter_101_1)
							var_101_4 = var_101_4 + 1
						end
					end

					if arg_100_0 == "buy" then
						ecfg.save(directory_buy_average .. "\\" .. arg_100_1 .. ".cfg", var_101_3[arg_100_1])
					elseif arg_100_0 == "sell" then
						ecfg.save(directory_sell_average .. "\\" .. arg_100_1 .. ".cfg", var_101_3[arg_100_1])
					end

					if var_101_4 == 0 then
						if arg_100_0 == "buy" then
							imgui.TNotif.add(u8("Скупка: у вас самые свежие цены от arz-wiki.com"), 3000)
						elseif arg_100_0 == "sell" then
							imgui.TNotif.add(u8("Продажа: у вас самые свежие цены от arz-wiki.com"), 3000)
						end
					else
						refresh_buy_top_list()

						if arg_100_0 == "buy" then
							imgui.TNotif.add(u8("Скупка: обновлено цен ") .. var_101_4 .. u8(" шт"), 3000)
						elseif arg_100_0 == "sell" then
							imgui.TNotif.add(u8("Продажа: обновлено цен ") .. var_101_4 .. u8(" шт"), 3000)
						end
					end
				elseif arg_100_0 == "buy" then
					imgui.TNotif.add(u8("Скупка: средних цен пока нет"), 3000)
				elseif arg_100_0 == "sell" then
					imgui.TNotif.add(u8("Продажа: средних цен пока нет"), 3000)
				end
			elseif arg_100_0 == "buy" then
				imgui.TNotif.add(u8("Скупка: не удалось обновить средние цены, нет файла"), 3000)
			elseif arg_100_0 == "sell" then
				imgui.TNotif.add(u8("Продажа: не удалось обновить средние цены, нет файла"), 3000)
			end
		elseif arg_101_1 == dlstatus.STATUSEX_ENDDOWNLOAD and not var_100_1 then
			if arg_100_0 == "buy" then
				imgui.TNotif.add(u8("Скупка: ошибка загрузки, попробуйте ещё раз"), 3000)
			elseif arg_100_0 == "sell" then
				imgui.TNotif.add(u8("Продажа: ошибка загрузки, попробуйте ещё раз"), 3000)
			end

			imgui.TNotif.add(u8(""), 3000)
		end
	end)
end

function download_average(arg_102_0, arg_102_1, arg_102_2)
	if arg_102_1 then
		asyncHttpRequest("GET", (ahref or "https://arz-wiki.com/action/?action=get_price&server=") .. safe_server(arg_102_1) .. "&type=" .. arg_102_0, nil, function(arg_103_0)
			local var_103_0 = decodeJson(arg_103_0.text)

			if type(var_103_0) == "table" and next(var_103_0) then
				local var_103_1

				if arg_102_0 == "buy" then
					var_103_1 = buy_average_price
				elseif arg_102_0 == "sell" then
					var_103_1 = sell_average_price
				end

				local var_103_2 = 0

				for iter_103_0, iter_103_1 in pairs(var_103_0) do
					if type(iter_103_1) == "table" and type(iter_103_1.list) == "table" and not iter_103_1.list[1] then
						local var_103_3 = {}

						for iter_103_2, iter_103_3 in pairs(iter_103_1.list) do
							table.insert(var_103_3, iter_103_3)
						end

						iter_103_1.list = var_103_3

						if var_103_3[1] then
							iter_103_1.list = var_103_3
						end
					end

					if type(iter_103_1) == "table" and type(iter_103_1.list) == "table" and iter_103_1.list[1] then
						for iter_103_4 = #iter_103_1.list, 1, -1 do
							local var_103_4 = iter_103_1.list[iter_103_4]

							if type(var_103_4[2]) == "number" and var_103_4[2] % 1 > 0 then
								var_103_4[2] = math.floor(var_103_4[2])
							end

							if type(var_103_4[3]) == "number" and var_103_4[3] % 1 > 0 then
								var_103_4[3] = math.floor(var_103_4[3])
							end

							if type(var_103_4[4]) == "number" and var_103_4[4] % 1 > 0 then
								var_103_4[4] = math.floor(var_103_4[4])
							end

							if type(var_103_4[5]) == "number" and var_103_4[5] % 1 > 0 then
								var_103_4[5] = math.floor(var_103_4[5])
							end

							if type(var_103_4[6]) == "number" and var_103_4[6] % 1 > 0 then
								var_103_4[6] = math.floor(var_103_4[6])
							end

							if type(var_103_4[2]) ~= "number" or not (var_103_4[2] > 0) then
								table.remove(iter_103_1.list, iter_103_4)

								if #iter_103_1.list < 1 then
									iter_103_1 = nil
								end
							elseif type(var_103_4[3]) ~= "number" or not (var_103_4[3] <= 2000000000) then
								table.remove(iter_103_1.list, iter_103_4)

								if #iter_103_1.list < 1 then
									iter_103_1 = nil
								end
							elseif type(var_103_4[3]) ~= "number" or not (var_103_4[3] / var_103_4[2] >= 10) or not (var_103_4[3] / var_103_4[2] <= 2000000000) then
								table.remove(iter_103_1.list, iter_103_4)

								if #iter_103_1.list < 1 then
									iter_103_1 = nil
								end
							elseif type(var_103_4[4]) ~= "number" or not (var_103_4[4] > 0) then
								table.remove(iter_103_1.list, iter_103_4)

								if #iter_103_1.list < 1 then
									iter_103_1 = nil
								end
							elseif (type(var_103_4[5]) ~= "number" or not (var_103_4[5] >= 10) or not (var_103_4[5] <= 2000000000)) and var_103_4[5] ~= nil then
								table.remove(iter_103_1.list, iter_103_4)

								if #iter_103_1.list < 1 then
									iter_103_1 = nil
								end
							elseif (type(var_103_4[6]) ~= "number" or not (var_103_4[6] >= 10) or not (var_103_4[6] <= 2000000000)) and var_103_4[6] ~= nil then
								table.remove(iter_103_1.list, iter_103_4)

								if #iter_103_1.list < 1 then
									iter_103_1 = nil
								end
							elseif var_103_4[5] ~= nil and var_103_4[6] ~= nil and (type(var_103_4[5]) ~= "number" or type(var_103_4[6]) ~= "number" or not (var_103_4[5] <= var_103_4[6])) then
								table.remove(iter_103_1.list, iter_103_4)

								if #iter_103_1.list < 1 then
									iter_103_1 = nil
								end
							end
						end

						if iter_103_1 then
							if var_103_1[arg_102_1] and var_103_1[arg_102_1][iter_103_0] and var_103_1[arg_102_1][iter_103_0].list and var_103_1[arg_102_1][iter_103_0].list[1] then
								if day_tonumber(iter_103_1.list[1][1]) > day_tonumber(var_103_1[arg_102_1][iter_103_0].list[1][1]) then
									var_103_1[arg_102_1][iter_103_0] = deepcopy(iter_103_1)
									var_103_2 = var_103_2 + 1
								elseif iter_103_1.list[1][1] == var_103_1[arg_102_1][iter_103_0].list[1][1] and (iter_103_1.list[1][2] ~= var_103_1[arg_102_1][iter_103_0].list[1][2] or iter_103_1.list[1][3] ~= var_103_1[arg_102_1][iter_103_0].list[1][3] or iter_103_1.list[1][4] ~= var_103_1[arg_102_1][iter_103_0].list[1][4] or iter_103_1.list[1][5] ~= var_103_1[arg_102_1][iter_103_0].list[1][5] or iter_103_1.list[1][6] ~= var_103_1[arg_102_1][iter_103_0].list[1][6]) then
									var_103_1[arg_102_1][iter_103_0] = deepcopy(iter_103_1)
									var_103_2 = var_103_2 + 1
								end
							else
								var_103_1[arg_102_1] = var_103_1[arg_102_1] or {}
								var_103_1[arg_102_1][iter_103_0] = deepcopy(iter_103_1)
								var_103_2 = var_103_2 + 1
							end
						end
					end
				end

				if arg_102_0 == "buy" then
					-- block empty
				elseif arg_102_0 == "sell" then
					-- block empty
				end

				if var_103_2 == 0 then
					if arg_102_0 == "buy" then
						-- block empty
					elseif arg_102_0 == "sell" then
						-- block empty
					end
				else
					refresh_buy_top_list()

					if arg_102_0 == "buy" then
						-- block empty
					elseif arg_102_0 == "sell" then
						-- block empty
					end
				end
			elseif arg_102_0 == "buy" then
				-- block empty
			elseif arg_102_0 == "sell" then
				-- block empty
			end
		end, function(arg_104_0)
			if arg_102_0 == "buy" and arg_102_1 ~= "Vice City" then
				av_try_sa_buy = av_try_sa_buy or 0
				av_try_sa_buy = av_try_sa_buy + 1
				av_try_sa_buy_clock = os.clock()
			elseif arg_102_0 == "sell" and arg_102_1 ~= "Vice City" then
				av_try_sa_sell = av_try_sa_sell or 0
				av_try_sa_sell = av_try_sa_sell + 1
				av_try_sa_sell_clock = os.clock()
			elseif arg_102_0 == "buy" and arg_102_1 == "Vice City" then
				av_try_vc_buy = av_try_vc_buy or 0
				av_try_vc_buy = av_try_vc_buy + 1
				av_try_vc_buy_clock = os.clock()
			elseif arg_102_0 == "sell" and arg_102_1 == "Vice City" then
				av_try_vc_sell = av_try_vc_sell or 0
				av_try_vc_sell = av_try_vc_sell + 1
				av_try_vc_sell_clock = os.clock()
			end
		end)
	else
		imgui.TNotif.add(u8("Для загрузки цен San Andreas нужно перезайти в игру!"))
	end
end

function upload_average(arg_105_0)
	for iter_105_0, iter_105_1 in ipairs(arg_105_0 or upload_items) do
		table.insert(upload_task, iter_105_1)
	end

	upload_items = {}

	sendFile("https://arz-wiki.com/action/?action=saveprice", encodeJson(upload_task), "file_upload", function(arg_106_0)
		upload_task = {}
	end, function(arg_107_0)
		return
	end)
end

function sendFile(arg_108_0, arg_108_1, arg_108_2)
	local var_108_0 = io.open(arg_108_1, "rb")

	if var_108_0 then
		local var_108_1 = string.match(arg_108_1, "([^/]+)$")
		local var_108_2 = var_108_0:read("*a")

		var_108_0:close()

		local var_108_3 = "BNDR"
		local var_108_4 = string.format("content-disposition: form-data; name=\"%s\"; filename=\"%s\"\r\ncontent-type: application/octet-stream\r\n", arg_108_2, var_108_1)
		local var_108_5 = string.format("--%s\r\n%s\r\n%s\r\n--%s--\r\n", var_108_3, var_108_4, var_108_2, var_108_3)
		local var_108_6 = requests.post(arg_108_0, {
			headers = {
				["Content-Type"] = string.format("multipart/form-data; boundary=%s", var_108_3),
				["Content-Length"] = var_108_5:len()
			},
			data = var_108_5
		})

		if var_108_6.status_code == 200 then
			return true, var_108_6.text
		end
	end

	return false
end

function sendFile(arg_109_0, arg_109_1, arg_109_2, arg_109_3, arg_109_4)
	local var_109_0 = filename_upload_task
	local var_109_1 = "BNDR"
	local var_109_2 = string.format("content-disposition: form-data; name=\"%s\"; filename=\"%s\"\r\ncontent-type: application/octet-stream\r\n", arg_109_2, var_109_0)
	local var_109_3 = string.format("--%s\r\n%s\r\n%s\r\n--%s--\r\n", var_109_1, var_109_2, arg_109_1, var_109_1)

	asyncHttpRequest("POST", arg_109_0, {
		headers = {
			["Content-Type"] = string.format("multipart/form-data; boundary=%s", var_109_1),
			["Content-Length"] = var_109_3:len()
		},
		data = var_109_3
	}, arg_109_3, arg_109_4)
end

alt_delay = {}
alt_delay.min = 0
alt_delay.max = 600
alt_delay.step = 1

function alt_packet()
	local var_110_0 = allocateMemory(68)

	sampStorePlayerOnfootData(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)), var_110_0)
	setStructElement(var_110_0, 4, 2, 1024, true)
	sampSendOnfootData(var_110_0)
	freeMemory(var_110_0)
end

function smart_alt()
	total = 0

	local var_111_0 = alt_delay.min

	while true do
		total = total + var_111_0

		wait(var_111_0)
		setGameKeyState(21, 256)

		if var_111_0 < alt_delay.max then
			var_111_0 = var_111_0 + alt_delay.step
		else
			var_111_0 = alt_delay.min
		end
	end
end

function is_lavka()
	for iter_112_0 = 0, 2048 do
		if sampIs3dTextDefined(iter_112_0) then
			local var_112_0, var_112_1, var_112_2, var_112_3, var_112_4, var_112_5, var_112_6, var_112_7, var_112_8 = sampGet3dTextInfoById(iter_112_0)
			local var_112_9, var_112_10, var_112_11 = getCharCoordinates(PLAYER_PED)
			local var_112_12 = getDistanceBetweenCoords3d(var_112_9, var_112_10, var_112_11, var_112_2, var_112_3, var_112_4)

			if var_112_0:match("[Уу]правлени. товарами") and var_112_12 <= var_112_5 then
				return true
			end
		end
	end

	return false
end

function getArizonaName()
	local var_113_0 = sampGetCurrentServerName()

	var_113_0 = var_113_0:match("^Arizona [^|]+ | ([^|]+) |") or var_113_0:match("^Arizona [^|]+ | ([^|]+)$")

	return var_113_0
end

function sep(arg_114_0)
	local var_114_0, var_114_1 = tostring(math.floor(arg_114_0)):match("(%-?)(%d+)")
	local var_114_2 = {}

	for iter_114_0 = #var_114_1, 1, -3 do
		table.insert(var_114_2, 1, var_114_1:sub(math.max(iter_114_0 - 2, 1), iter_114_0))
	end

	return var_114_0 .. table.concat(var_114_2, ".")
end

function knum(arg_115_0, arg_115_1, arg_115_2)
	arg_115_1 = arg_115_1 or 1
	arg_115_2 = arg_115_2 or 1000

	local var_115_0

	if arg_115_2 <= arg_115_0 then
		local var_115_1 = math.floor(math.log(arg_115_0) / math.log(1000))

		arg_115_0 = math.floor(arg_115_0 / 1000^var_115_1 * 10^arg_115_1) / 10^arg_115_1
		var_115_0 = string.format("%." .. arg_115_1 .. "f%s", arg_115_0, string.rep("k", var_115_1)):gsub("%.?0+([k]*)$", "%1")
	elseif arg_115_1 > 0 then
		var_115_0 = string.format("%." .. arg_115_1 .. "f", arg_115_0):gsub("%.?0+$", "")
	else
		var_115_0 = tostring(math.floor(arg_115_0))
	end

	return var_115_0
end

function is_safe(arg_116_0)
	if arg_116_0:match("[\\/:%*%?<>|]") or #arg_116_0 < 1 then
		return false
	else
		return true
	end
end

function calculate_number()
	local var_117_0

	if buy_playlist.auto_number_mode == "static" then
		var_117_0 = buy_playlist.auto_number_static
	elseif buy_playlist.auto_number_mode == "all" then
		var_117_0 = getPlayerMoney(PLAYER_HANDLE) - buy_playlist.auto_number_all
	end

	local var_117_1 = 0
	local var_117_2 = {}
	local var_117_3 = {}

	for iter_117_0, iter_117_1 in ipairs(buy_playlist) do
		if not auto_number_dict[iter_117_1.name] and iter_117_1.enabled and iter_117_1.auto_number then
			iter_117_1.enabled = false
			img.buy_playlist[iter_117_0].enabled.v = iter_117_1.enabled

			ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, iter_117_0, iter_117_1)
		elseif iter_117_1.enabled and iter_117_1.auto_number then
			table.insert(var_117_3, {
				number = 0,
				name = iter_117_1.name,
				price = iter_117_1.price
			})
		elseif iter_117_1.enabled and not iter_117_1.auto_number then
			var_117_1 = var_117_1 + iter_117_1.number * iter_117_1.price
			var_117_2[iter_117_1.name] = iter_117_1.number
		end
	end

	table.sort(var_117_3, function(arg_118_0, arg_118_1)
		return arg_118_0.price > arg_118_1.price
	end)

	local var_117_4 = true

	while var_117_4 do
		var_117_4 = false

		local var_117_5 = (var_117_0 - var_117_1) / #var_117_3

		for iter_117_2, iter_117_3 in ipairs(var_117_3) do
			if var_117_5 < iter_117_3.price or iter_117_3.price < 1 then
				table.remove(var_117_3, iter_117_2)

				var_117_2[iter_117_3.name] = 0
				var_117_4 = true

				break
			end
		end
	end

	local var_117_6 = {}
	local var_117_7 = {}

	for iter_117_4, iter_117_5 in ipairs(var_117_3) do
		if auto_number_dict[iter_117_5.name] == "price" or auto_number_dict[iter_117_5.name] == "level_and_price" then
			table.insert(var_117_7, iter_117_5)
		elseif auto_number_dict[iter_117_5.name] == "number_and_price" then
			table.insert(var_117_6, iter_117_5)
		end
	end

	for iter_117_6, iter_117_7 in ipairs(var_117_7) do
		if var_117_0 - var_117_1 >= iter_117_7.price then
			iter_117_7.number = 1
			var_117_2[iter_117_7.name] = iter_117_7.number
			var_117_1 = var_117_1 + iter_117_7.price
		end
	end

	local var_117_8 = true

	while var_117_8 do
		var_117_8 = false

		for iter_117_8, iter_117_9 in ipairs(var_117_6) do
			local var_117_9 = (var_117_0 - var_117_1) / #var_117_6

			if var_117_9 >= iter_117_9.price then
				local var_117_10 = math.floor(var_117_9 / iter_117_9.price)

				iter_117_9.number = iter_117_9.number + var_117_10
				var_117_8 = true
				var_117_2[iter_117_9.name] = iter_117_9.number
				var_117_1 = var_117_1 + var_117_10 * iter_117_9.price
			end
		end
	end

	local var_117_11 = true

	while var_117_11 do
		var_117_11 = false

		for iter_117_10, iter_117_11 in ipairs(var_117_6) do
			if var_117_0 - var_117_1 >= iter_117_11.price then
				iter_117_11.number = iter_117_11.number + 1
				var_117_2[iter_117_11.name] = iter_117_11.number
				var_117_1 = var_117_1 + iter_117_11.price
				var_117_11 = true
			end
		end
	end

	for iter_117_12, iter_117_13 in ipairs(buy_playlist) do
		if iter_117_13.enabled then
			iter_117_13.number = var_117_2[iter_117_13.name] or iter_117_13.number
			img.buy_playlist[iter_117_12].number.v = iter_117_13.number

			ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, iter_117_12, iter_117_13)
		end
	end

	imgui.TNotif.add(u8("Готово"), 2000)
end

function buy_add_item(arg_119_0)
	local var_119_0 = {
		number_dynamic = 0,
		lvl = 1,
		name = arg_119_0,
		enabled = set.buy_default_enabled,
		price = set.buy_default_price,
		number = set.buy_default_number,
		auto_number = set.buy_default_auto_number
	}

	if set.to_start then
		table.insert(buy_playlist, 1, var_119_0)
		ecfg.table_insert(directory_buy .. "\\" .. set.current_playlist, 1, var_119_0)
	else
		table.insert(buy_playlist, var_119_0)
		ecfg.table_insert(directory_buy .. "\\" .. set.current_playlist, var_119_0)
	end

	buy_dplaylist[arg_119_0] = var_119_0.price

	local var_119_1 = {
		name = u8(var_119_0.name),
		enabled = imgui.ImBool(var_119_0.enabled),
		price = imgui.ImInt(var_119_0.price),
		number = imgui.ImInt(var_119_0.number),
		number_dynamic = imgui.ImInt(var_119_0.number_dynamic),
		lvl = imgui.ImInt(var_119_0.lvl)
	}

	if set.to_start then
		table.insert(img.buy_playlist, 1, var_119_1)
	else
		table.insert(img.buy_playlist, var_119_1)
	end

	buy_do_refresh_right_draw_list = true
end

function sell_add_item(arg_120_0)
	local var_120_0 = {
		number_dynamic = 0,
		name = arg_120_0,
		enabled = set.sell_default_enabled,
		price = set.sell_default_price,
		number = set.sell_default_number,
		maximum = set.sell_default_maximum
	}

	if set.to_start then
		table.insert(sell_playlist, 1, var_120_0)
		ecfg.table_insert(directory_sell .. "\\" .. set.current_playlist, 1, var_120_0)
	else
		table.insert(sell_playlist, var_120_0)
		ecfg.table_insert(directory_sell .. "\\" .. set.current_playlist, var_120_0)
	end

	sell_dplaylist[arg_120_0] = var_120_0.price

	local var_120_1 = {
		name = u8(var_120_0.name),
		enabled = imgui.ImBool(var_120_0.enabled),
		price = imgui.ImInt(var_120_0.price),
		number = imgui.ImInt(var_120_0.number),
		number_dynamic = imgui.ImInt(var_120_0.number_dynamic)
	}

	if set.to_start then
		table.insert(img.sell_playlist, 1, var_120_1)
	else
		table.insert(img.sell_playlist, var_120_1)
	end

	sell_do_refresh_right_draw_list = true
end

function create_playlist(arg_121_0, arg_121_1)
	local var_121_0 = false

	if not doesFileExist(directory_buy .. "\\" .. arg_121_0 .. ".cfg") and #arg_121_0 > 0 and is_safe(arg_121_0) then
		local var_121_1 = buy_playlist.price_value or "$"

		buy_playlist = {}
		buy_playlist.price_value = var_121_1
		buy_dplaylist = {}
		img.buy_playlist = {}

		ecfg.table_save(directory_buy .. "\\" .. arg_121_0 .. ".cfg", buy_playlist)

		var_121_0 = true
	end

	if not doesFileExist(directory_sell .. "\\" .. arg_121_0 .. ".cfg") and #arg_121_0 > 0 and is_safe(arg_121_0) then
		local var_121_2 = sell_playlist.price_value or "$"

		sell_playlist = {}
		sell_playlist.price_value = var_121_2
		sell_dplaylist = {}
		img.sell_playlist = {}

		ecfg.table_save(directory_sell .. "\\" .. arg_121_0 .. ".cfg", sell_playlist)

		var_121_0 = true
	end

	if var_121_0 then
		refresh_playlists()

		if arg_121_1 then
			set.current_playlist = arg_121_0 .. ".cfg"

			ecfg.save(filename_set, set)
			load_current_playlist()
		end
	end
end

function refresh_playlists()
	playlists = {}

	local var_122_0 = {}

	for iter_122_0 in lfs.dir(directory_buy) do
		if iter_122_0 ~= "." and iter_122_0 ~= ".." then
			if iter_122_0 == "Основной.cfg" then
				table.insert(playlists, 1, iter_122_0)

				var_122_0[iter_122_0] = true
			else
				table.insert(playlists, iter_122_0)

				var_122_0[iter_122_0] = true
			end
		end
	end

	for iter_122_1 in lfs.dir(directory_sell) do
		if iter_122_1 ~= "." and iter_122_1 ~= ".." and not var_122_0[iter_122_1] then
			if iter_122_1 == "Основной.cfg" then
				table.insert(playlists, 1, iter_122_1)
			else
				table.insert(playlists, iter_122_1)
			end
		end
	end
end

function remove_current_playlist()
	local var_123_0

	for iter_123_0, iter_123_1 in ipairs(playlists) do
		if set.current_playlist == iter_123_1 then
			var_123_0 = iter_123_0

			break
		end
	end

	os.remove(directory_buy .. "\\" .. set.current_playlist)
	os.remove(directory_sell .. "\\" .. set.current_playlist)
	refresh_playlists()

	set.current_playlist = playlists[var_123_0] or playlists[var_123_0 - 1]

	ecfg.save(filename_set, set)
	load_current_playlist()
end

function exchange_sa_to_vc()
	if buy_playlist.price_value == "$" then
		for iter_124_0, iter_124_1 in ipairs(buy_playlist) do
			iter_124_1.price = math.floor(iter_124_1.price / set.buy_vc)
			img.buy_playlist[iter_124_0].price.v = iter_124_1.price
		end

		buy_playlist.price_value = "VC$"

		ecfg.table_save(directory_buy .. "\\" .. set.current_playlist, buy_playlist)
	end

	if sell_playlist.price_value == "$" then
		for iter_124_2, iter_124_3 in ipairs(sell_playlist) do
			iter_124_3.price = math.floor(iter_124_3.price / set.buy_vc)
			img.sell_playlist[iter_124_2].price.v = iter_124_3.price
		end

		sell_playlist.price_value = "VC$"

		ecfg.table_save(directory_sell .. "\\" .. set.current_playlist, sell_playlist)
	end
end

function exchange_vc_to_sa()
	if buy_playlist.price_value == "VC$" then
		for iter_125_0, iter_125_1 in ipairs(buy_playlist) do
			iter_125_1.price = iter_125_1.price * set.buy_sa
			img.buy_playlist[iter_125_0].price.v = iter_125_1.price
		end

		buy_playlist.price_value = "$"

		ecfg.table_save(directory_buy .. "\\" .. set.current_playlist, buy_playlist)
	end

	if sell_playlist.price_value == "VC$" then
		for iter_125_2, iter_125_3 in ipairs(sell_playlist) do
			iter_125_3.price = iter_125_3.price * set.buy_sa
			img.sell_playlist[iter_125_2].price.v = iter_125_3.price
		end

		sell_playlist.price_value = "$"

		ecfg.table_save(directory_sell .. "\\" .. set.current_playlist, sell_playlist)
	end
end

function load_current_playlist()
	local var_126_0 = ecfg.table_load(directory_buy .. "\\" .. set.current_playlist, true)

	if var_126_0 then
		buy_playlist = var_126_0
	else
		local var_126_1 = directory_buy_backup .. "\\" .. set.current_playlist .. ", " .. os.date("%Y-%m-%d %H.%M.%S") .. ", " .. os.clock() .. ".cfg"
		local var_126_2 = ecfg.load(directory_buy .. "\\" .. set.current_playlist)

		if doesFileExist(directory_buy .. "\\" .. set.current_playlist) then
			ecfg.mkpath(var_126_1)
			os.rename(directory_buy .. "\\" .. set.current_playlist, var_126_1)
		end

		if var_126_2 then
			buy_playlist = var_126_2

			ecfg.table_save(directory_buy .. "\\" .. set.current_playlist, buy_playlist)
		else
			local var_126_3 = directory_buy_backup .. "\\" .. set.current_playlist .. " " .. os.date("%Y-%m-%d %H.%M.%S") .. ", " .. os.clock() .. ".cfg"

			if doesFileExist(directory_buy .. "\\" .. set.current_playlist) then
				ecfg.mkpath(var_126_3)
				os.rename(directory_buy .. "\\" .. set.current_playlist, var_126_3)
			end

			buy_playlist = {}

			ecfg.table_save(directory_buy .. "\\" .. set.current_playlist, buy_playlist)
		end
	end

	if buy_playlist.price_value == "SA$" then
		buy_playlist.price_value = "$"
	else
		buy_playlist.price_value = buy_playlist.price_value or "$"
	end

	buy_playlist.auto_number_mode = buy_playlist.auto_number_mode or "all"
	buy_playlist.auto_number_all = buy_playlist.auto_number_all or 0
	buy_playlist.auto_number_static = buy_playlist.auto_number_static or 0
	buy_playlist.filter_not_null = buy_playlist.filter_not_null or false
	buy_playlist.filter_enabled = buy_playlist.filter_enabled or false
	buy_playlist.filter_not_enabled = buy_playlist.filter_not_enabled or false
	buy_playlist.filter_null = buy_playlist.filter_null or false
	buy_playlist.filter_auto_number = buy_playlist.filter_auto_number or false
	buy_playlist.filter_not_auto_number = buy_playlist.filter_not_auto_number or false
	img.buy_playlist = {}
	img.buy_playlist.filter_not_null = imgui.ImBool(buy_playlist.filter_not_null)
	img.buy_playlist.filter_enabled = imgui.ImBool(buy_playlist.filter_enabled)
	img.buy_playlist.filter_not_enabled = imgui.ImBool(buy_playlist.filter_not_enabled)
	img.buy_playlist.filter_null = imgui.ImBool(buy_playlist.filter_null)
	img.buy_playlist.filter_auto_number = imgui.ImBool(buy_playlist.filter_auto_number)
	img.buy_playlist.filter_not_auto_number = imgui.ImBool(buy_playlist.filter_not_auto_number)
	img.auto_number_all = imgui.ImInt(buy_playlist.auto_number_all)
	img.auto_number_static = imgui.ImInt(buy_playlist.auto_number_static)
	buy_dplaylist = {}

	for iter_126_0, iter_126_1 in ipairs(buy_playlist) do
		iter_126_1.number_dynamic = iter_126_1.number_dynamic or iter_126_1.number
		iter_126_1.lvl = iter_126_1.lvl or 1

		if iter_126_1.auto_number == nil then
			iter_126_1.auto_number = true
		end

		buy_dplaylist[iter_126_1.name] = iter_126_1.price
	end

	local var_126_4 = ecfg.table_load(directory_sell .. "\\" .. set.current_playlist, true)

	if var_126_4 then
		sell_playlist = var_126_4
	else
		local var_126_5 = directory_sell_backup .. "\\" .. set.current_playlist .. ", " .. os.date("%Y-%m-%d %H.%M.%S") .. ", " .. os.clock() .. ".cfg"
		local var_126_6 = ecfg.load(directory_sell .. "\\" .. set.current_playlist)

		if doesFileExist(directory_sell .. "\\" .. set.current_playlist) then
			ecfg.mkpath(var_126_5)
			os.rename(directory_sell .. "\\" .. set.current_playlist, var_126_5)
		end

		if var_126_6 then
			sell_playlist = var_126_6

			ecfg.table_save(directory_sell .. "\\" .. set.current_playlist, sell_playlist)
		else
			local var_126_7 = directory_sell_backup .. "\\" .. set.current_playlist .. " " .. os.date("%Y-%m-%d %H.%M.%S") .. ", " .. os.clock() .. ".cfg"

			if doesFileExist(directory_sell .. "\\" .. set.current_playlist) then
				ecfg.mkpath(var_126_7)
				os.rename(directory_sell .. "\\" .. set.current_playlist, var_126_7)
			end

			sell_playlist = {}

			ecfg.table_save(directory_sell .. "\\" .. set.current_playlist, sell_playlist)
		end
	end

	if sell_playlist.price_value == "SA$" then
		sell_playlist.price_value = "$"
	else
		sell_playlist.price_value = sell_playlist.price_value or "$"
	end

	sell_playlist.filter_not_empty = sell_playlist.filter_not_empty or false
	sell_playlist.filter_enabled = sell_playlist.filter_enabled or false
	sell_playlist.filter_not_enabled = sell_playlist.filter_not_enabled or false
	sell_playlist.filter_empty = sell_playlist.filter_empty or false
	sell_playlist.filter_null = sell_playlist.filter_null or false
	sell_playlist.filter_not_null = sell_playlist.filter_not_null or false
	img.sell_playlist = {}
	img.sell_playlist.filter_not_empty = imgui.ImBool(sell_playlist.filter_not_empty)
	img.sell_playlist.filter_enabled = imgui.ImBool(sell_playlist.filter_enabled)
	img.sell_playlist.filter_not_enabled = imgui.ImBool(sell_playlist.filter_not_enabled)
	img.sell_playlist.filter_empty = imgui.ImBool(sell_playlist.filter_empty)
	img.sell_playlist.filter_null = imgui.ImBool(sell_playlist.filter_null)
	img.sell_playlist.filter_not_null = imgui.ImBool(sell_playlist.filter_not_null)
	sell_dplaylist = {}

	for iter_126_2, iter_126_3 in ipairs(sell_playlist) do
		iter_126_3.number_dynamic = iter_126_3.number_dynamic or iter_126_3.number
		sell_dplaylist[iter_126_3.name] = iter_126_3.price
	end

	for iter_126_4, iter_126_5 in ipairs(buy_playlist) do
		local var_126_8 = {
			name = u8(iter_126_5.name),
			enabled = imgui.ImBool(iter_126_5.enabled),
			price = imgui.ImInt(iter_126_5.price),
			number = imgui.ImInt(iter_126_5.number),
			number_dynamic = imgui.ImInt(iter_126_5.number_dynamic),
			lvl = imgui.ImInt(iter_126_5.lvl)
		}

		table.insert(img.buy_playlist, var_126_8)
	end

	for iter_126_6, iter_126_7 in ipairs(sell_playlist) do
		local var_126_9 = {
			name = u8(iter_126_7.name),
			enabled = imgui.ImBool(iter_126_7.enabled),
			price = imgui.ImInt(iter_126_7.price),
			number = imgui.ImInt(iter_126_7.number),
			number_dynamic = imgui.ImInt(iter_126_7.number_dynamic)
		}

		table.insert(img.sell_playlist, var_126_9)
	end

	buy_do_refresh_right_draw_list = true
	sell_do_refresh_right_draw_list = true
end

function buy_clear_current_playlist()
	buy_playlist = {
		price_value = buy_playlist.price_value or "$"
	}
	buy_dplaylist = {}
	img.buy_playlist = {}

	ecfg.table_save(directory_buy .. "\\" .. set.current_playlist, buy_playlist)

	buy_do_refresh_right_draw_list = true
end

function sell_clear_current_playlist()
	sell_playlist = {
		price_value = sell_playlist.price_value or "$"
	}
	sell_dplaylist = {}
	img.sell_playlist = {}

	ecfg.table_save(directory_sell .. "\\" .. set.current_playlist, sell_playlist)

	sell_do_refresh_right_draw_list = true
end

function buy_move_item(arg_129_0, arg_129_1)
	local var_129_0 = table.remove(buy_playlist, arg_129_0)
	local var_129_1 = table.remove(img.buy_playlist, arg_129_0)

	table.insert(buy_playlist, arg_129_1, var_129_0)
	table.insert(img.buy_playlist, arg_129_1, var_129_1)
	ecfg.table_remove(directory_buy .. "\\" .. set.current_playlist, arg_129_0)
	ecfg.table_insert(directory_buy .. "\\" .. set.current_playlist, arg_129_1, var_129_0)

	buy_do_refresh_right_draw_list = true
end

function sell_move_item(arg_130_0, arg_130_1)
	local var_130_0 = table.remove(sell_playlist, arg_130_0)
	local var_130_1 = table.remove(img.sell_playlist, arg_130_0)

	table.insert(sell_playlist, arg_130_1, var_130_0)
	table.insert(img.sell_playlist, arg_130_1, var_130_1)
	ecfg.table_remove(directory_sell .. "\\" .. set.current_playlist, arg_130_0)
	ecfg.table_insert(directory_sell .. "\\" .. set.current_playlist, arg_130_1, var_130_0)

	sell_do_refresh_right_draw_list = true
end

function buy_paste(arg_131_0, arg_131_1, arg_131_2)
	if arg_131_2 == "price_only" then
		for iter_131_0, iter_131_1 in ipairs(arg_131_0) do
			if buy_dplaylist[iter_131_1.name] then
				buy_dplaylist[iter_131_1.name] = iter_131_1.price
			end
		end

		for iter_131_2, iter_131_3 in ipairs(arg_131_1) do
			iter_131_3.price = buy_dplaylist[iter_131_3.name]
			img.buy_playlist[iter_131_2].price.v = iter_131_3.price

			ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, iter_131_2, iter_131_3)
		end
	elseif arg_131_2 == "add" then
		for iter_131_4, iter_131_5 in ipairs(arg_131_0) do
			if not buy_dplaylist[iter_131_5.name] then
				table.insert(arg_131_1, iter_131_5)

				buy_dplaylist[iter_131_5.name] = iter_131_5.price

				ecfg.table_insert(directory_buy .. "\\" .. set.current_playlist, iter_131_5)

				local var_131_0 = {
					name = u8(iter_131_5.name),
					enabled = imgui.ImBool(iter_131_5.enabled),
					price = imgui.ImInt(iter_131_5.price),
					number = imgui.ImInt(iter_131_5.number),
					number_dynamic = imgui.ImInt(iter_131_5.number_dynamic or iter_131_5.number),
					lvl = imgui.ImInt(iter_131_5.lvl)
				}

				table.insert(img.buy_playlist, var_131_0)
			end
		end
	end

	buy_do_refresh_right_draw_list = true
end

function sell_paste(arg_132_0, arg_132_1, arg_132_2)
	if arg_132_2 == "price_only" then
		for iter_132_0, iter_132_1 in ipairs(arg_132_0) do
			if sell_dplaylist[iter_132_1.name] then
				sell_dplaylist[iter_132_1.name] = iter_132_1.price
			end
		end

		for iter_132_2, iter_132_3 in ipairs(arg_132_1) do
			iter_132_3.price = sell_dplaylist[iter_132_3.name]
			img.sell_playlist[iter_132_2].price.v = iter_132_3.price

			ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, iter_132_2, iter_132_3)
		end

		ecfg.table_insert(directory_sell .. "\\" .. set.current_playlist, item)
	elseif arg_132_2 == "add" then
		for iter_132_4, iter_132_5 in ipairs(arg_132_0) do
			if not sell_dplaylist[iter_132_5.name] then
				table.insert(arg_132_1, iter_132_5)

				sell_dplaylist[iter_132_5.name] = iter_132_5.price

				ecfg.table_insert(directory_sell .. "\\" .. set.current_playlist, iter_132_5)

				local var_132_0 = {
					name = u8(iter_132_5.name),
					enabled = imgui.ImBool(iter_132_5.enabled),
					price = imgui.ImInt(iter_132_5.price),
					number = imgui.ImInt(iter_132_5.number),
					number_dynamic = imgui.ImInt(iter_132_5.number_dynamic or iter_132_5.number)
				}

				table.insert(img.sell_playlist, var_132_0)
			end
		end
	end

	sell_do_refresh_right_draw_list = true
end

function EXPORTS.buy(arg_133_0, arg_133_1, arg_133_2)
	local var_133_0 = arg_133_1:gsub("{%x%x%x%x%x%x}", "")
	local var_133_1 = var_133_0:find("Добавить товар на покупку", 1, true)
	local var_133_2 = var_133_0:find("Название\tСкупаете\tСтоимость", 1, true)

	ready_mode = var_133_1 and 1 or var_133_2 and 2

	if ready_mode and arg_133_0 then
		buy_task = {}

		for iter_133_0, iter_133_1 in ipairs(buy_playlist) do
			if iter_133_1.enabled and iter_133_1.price >= 10 and (set.dynamic and iter_133_1.number_dynamic or iter_133_1.number) > 0 then
				if not set.dynamic then
					iter_133_1.number_dynamic = iter_133_1.number

					ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, iter_133_0, iter_133_1)

					img.buy_playlist[iter_133_0].number_dynamic.v = iter_133_1.number
				end

				local var_133_3 = {
					name = iter_133_1.name,
					number = set.dynamic and iter_133_1.number_dynamic or iter_133_1.number,
					price = iter_133_1.price,
					lvl = iter_133_1.lvl
				}

				table.insert(buy_task, var_133_3)
			end
		end

		if #buy_task > 0 then
			buy_dubl = {}
			buy_running = true
			set.dynamic = false

			ecfg.save(filename_set, set)

			if ready_mode == 1 then
				if set.buy_use_search then
					sampSendDialogResponse(arg_133_0, 1, 2, "Добавить товар на покупку (поиск по предметам)")
				else
					sampSendDialogResponse(arg_133_0, 1, 1, "Добавить товар на покупку")
				end
			elseif ready_mode == 2 then
				sampSendDialogResponse(arg_133_0, 0, 0, "")
			else
				return false
			end
		else
			imgui.TNotif.add(u8("Нет активных товаров. Включите галочки и установитте количество"), 3000)

			return true
		end

		img.window_menu.v = false

		return true
	else
		return false
	end
end

function EXPORTS.buy_cancel(arg_134_0, arg_134_1)
	if arg_134_1 then
		buy_cancel = true
		img.window_menu.v = false

		if arg_134_1 == 1 then
			sampSendDialogResponse(arg_134_0, 1, 3, "Прекратить покупку товара")
		elseif arg_134_1 == 2 then
			sampSendDialogResponse(arg_134_0, 0, 0, "")
		end

		return true
	else
		return false
	end
end

function EXPORTS.buy_get_sum()
	local var_135_0 = 0

	for iter_135_0, iter_135_1 in ipairs(buy_playlist) do
		if iter_135_1.enabled then
			if set.dynamic then
				var_135_0 = var_135_0 + iter_135_1.number_dynamic * iter_135_1.price
			else
				var_135_0 = var_135_0 + iter_135_1.number * iter_135_1.price
			end
		end
	end

	return var_135_0
end

EXPORTS.buy_get_summ = EXPORTS.buy_get_sum

function EXPORTS.sell_with_refresh()
	local var_136_0 = EXPORTS.sell_refresh()

	sell_vystavit = true

	return var_136_0
end

right_cell_pos = {
	x = {
		[378] = 3,
		[325] = 1,
		[431] = 5,
		[351] = 2,
		[457] = 6,
		[404] = 4
	},
	y = {
		[256] = 18,
		[317] = 30,
		[164] = 0,
		[225] = 12,
		[286] = 24,
		[195] = 6
	}
}
right_info = {
	x = {
		[429] = "4",
		[349] = "1",
		[402] = "3",
		[482] = "6",
		[455] = "5",
		[376] = "2"
	},
	y = {
		[217] = "2",
		[308] = "5",
		[339] = "6",
		[247] = "3",
		[278] = "4",
		[186] = "1"
	}
}
right_pages = {
	x = {
		[418] = 5,
		[408] = 4,
		[399] = 3,
		[380] = 1,
		[389] = 2
	},
	y = {
		[351] = 0
	}
}

function get_right_inv_list_item(arg_137_0)
	for iter_137_0, iter_137_1 in ipairs(right_inv_list) do
		if iter_137_1.name == arg_137_0 then
			return iter_137_1, iter_137_0
		end
	end
end

texdraw_clicker = {}
right_cell_dict = {}
right_cell_selectable_dict = {}
right_cell_list = {}
right_current_page = 1
right_page_list = {}
right_coord_dict = {}

function get_right_page_pos(arg_138_0, arg_138_1)
	if right_pages.x[math.floor(arg_138_0)] and right_pages.y[math.floor(arg_138_1)] then
		return right_pages.x[math.floor(arg_138_0)] + right_pages.y[math.floor(arg_138_1)]
	else
		return 0
	end
end

function get_right_cell_pos(arg_139_0, arg_139_1)
	if right_cell_pos.x[math.floor(arg_139_0)] and right_cell_pos.y[math.floor(arg_139_1)] then
		return right_cell_pos.x[math.floor(arg_139_0)] + right_cell_pos.y[math.floor(arg_139_1)]
	else
		return 0
	end
end

function EXPORTS.sell(arg_140_0, arg_140_1, arg_140_2)
	local var_140_0 = arg_140_1:gsub("{%x%x%x%x%x%x}", "")
	local var_140_1 = var_140_0:find("Управление продажей товаров", 1, true) or var_140_0:find("[1] Управление продажей товаров", 1, true)
	local var_140_2 = var_140_0:find("Название\tВ наличии\tВ продаже\tСтоимость", 1, true)

	ready_mode = var_140_1 and 1 or var_140_2 and 2

	if ready_mode and arg_140_0 then
		sell_task = {}
		right_next = true
		right_id_index = 1
		right_page_index = 1
		right_name_map = {}

		for iter_140_0, iter_140_1 in ipairs(sell_playlist) do
			if not (not iter_140_1.enabled or iter_140_1.price < 10 or not sell_number_dict[iter_140_1.name] or sell_number_dict[iter_140_1.name] and sell_number_dict[iter_140_1.name] < 1 or set.dynamic and iter_140_1.number_dynamic < 1 and not iter_140_1.maximum or not set.dynamic and iter_140_1.number < 1 and not iter_140_1.maximum) then
				if not set.dynamic then
					iter_140_1.number_dynamic = not iter_140_1.maximum and iter_140_1.number or sell_number_dict[iter_140_1.name] or 0

					ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, iter_140_0, iter_140_1)

					img.sell_playlist[iter_140_0].number_dynamic.v = not iter_140_1.maximum and iter_140_1.number or sell_number_dict[iter_140_1.name] or 0
				end

				local var_140_3 = {
					maximum = false,
					name = iter_140_1.name,
					number = iter_140_1.maximum and sell_number_dict[iter_140_1.name] or set.dynamic and iter_140_1.number_dynamic or iter_140_1.number,
					price = iter_140_1.price
				}

				table.insert(sell_task, var_140_3)
			end
		end

		sell_running = true
		sell_dubl = {}
		set.dynamic = false

		ecfg.save(filename_set, set)
		ecfg.table_save(directory_sell .. "\\" .. set.current_playlist, sell_playlist)

		if arg_140_2 and sampIsDialogActive() then
			if ready_mode == 1 then
				sampSendDialogResponse(arg_140_0, 1, 0, "Управление продажей товаров")
			elseif ready_mode == 2 then
				sampSendDialogResponse(arg_140_0, 0, 0, "")
			end
		elseif arg_140_2 and not sampIsDialogActive() then
			return false
		end

		img.window_menu.v = false

		return true
	else
		return false
	end
end

function EXPORTS.sell_refresh()
	local var_141_0 = sampGetDialogText():gsub("{%x%x%x%x%x%x}", "")
	local var_141_1 = true

	img.window_menu.v = false

	if ready then
		img.window_menu.v = false
		sell_parsing = true
		sell_number_dict = {}
		sell_list = {}
		right_current_page = 1
		right_cell_list = {}
		right_inv_list = {}
		right_cell_selectable_dict = {}
		right_page_list = {}
		sell_dlist = {}

		ecfg.save(filename_sell_list, sell_list)
		sampSendClickTextdraw(65535)
		sampSendDialogResponse(sampGetCurrentDialogId(), 1, 0, "1. Выставить товар на продажу")

		return true
	elseif ready2 then
		sell_parsing = true
		sell_number_dict = {}
		sell_list = {}
		right_cell_list = {}
		right_inv_list = {}
		right_current_page = 1
		right_cell_selectable_dict = {}
		right_page_list = {}
		sell_dlist = {}

		ecfg.save(filename_sell_list, sell_list)
		sampSendClickTextdraw(65535)
		sampSendDialogResponse(sampGetCurrentDialogId(), 0, 0, "")

		return true
	elseif var_141_1 then
		sell_parsing2 = true
		sell_number_dict = {}
		sell_name_dict = {}
		sell_list = {}
		right_cell_list = {}
		right_inv_list = {}
		right_current_page = 1
		right_cell_selectable_dict = {}
		right_page_list = {}
		sell_dlist = {}
		sell_skip = {}

		sampSendClickTextdraw(65535)
		ecfg.save(filename_sell_list, sell_list)
		sampSendChat("/stats")

		return true
	else
		return false
	end
end

function EXPORTS.sell_cancel(arg_142_0, arg_142_1)
	if arg_142_1 then
		sell_cancel = true
		img.window_menu.v = false

		if arg_142_1 == 1 then
			sampSendDialogResponse(sampGetCurrentDialogId(), 1, 1, "2. Удалить товар с продажи")
		elseif arg_142_1 == 2 then
			sampSendDialogResponse(sampGetCurrentDialogId(), 0, 0, "")
		end

		return true
	else
		return false
	end
end

function EXPORTS.sell_get_sum()
	local var_143_0 = 0
	local var_143_1 = sell_playlist.price_value == "$" and set.sell_komm or sell_playlist.price_value == "VC$" and set.sell_komm_vc

	for iter_143_0, iter_143_1 in ipairs(sell_playlist) do
		if iter_143_1.enabled then
			local var_143_2

			if iter_143_1.maximum and not dynamic then
				var_143_2 = sell_number_dict[iter_143_1.name] or 0
			elseif set.dynamic then
				var_143_2 = iter_143_1.number_dynamic
			else
				var_143_2 = iter_143_1.number
			end

			var_143_0 = var_143_0 + var_143_2 * iter_143_1.price
		end
	end

	if next(sell_number_dict) then
		local var_143_3 = math.floor(var_143_0 * (1 - var_143_1 / 100))
		local var_143_4 = var_143_0 - var_143_3

		return {
			var_143_0,
			var_143_4,
			var_143_3
		}
	else
		return {
			0,
			0,
			0
		}
	end
end

EXPORTS.sell_get_summ = EXPORTS.sell_get_sum

function EXPORTS.is_working()
	return buy_running or sell_running or buy_cancel or sell_cancel or sell_average_parsing or sell_vystavit or buy_average_parsing or buy_parsing or sell_parsing or sell_parsing2 or fatality or auto_number_checking
end

function buy_filter(arg_145_0)
	if buy_playlist.filter_enabled and not arg_145_0.enabled then
		return false
	elseif buy_playlist.filter_not_enabled and arg_145_0.enabled then
		return false
	elseif buy_playlist.filter_not_null and arg_145_0.price < 10 then
		return false
	elseif buy_playlist.filter_null and arg_145_0.price ~= 0 then
		return false
	elseif buy_playlist.filter_auto_number and not arg_145_0.auto_number then
		return false
	elseif buy_playlist.filter_not_auto_number and arg_145_0.auto_number then
		return false
	else
		return true
	end
end

function sell_filter(arg_146_0)
	if sell_playlist.filter_enabled and not arg_146_0.enabled then
		return false
	elseif sell_playlist.filter_not_enabled and arg_146_0.enabled then
		return false
	elseif sell_playlist.filter_not_empty and (not sell_number_dict[arg_146_0.name] or not (sell_number_dict[arg_146_0.name] > 0)) then
		return false
	elseif sell_playlist.filter_empty and sell_number_dict[arg_146_0.name] and sell_number_dict[arg_146_0.name] > 0 then
		return false
	elseif sell_playlist.filter_null and arg_146_0.price ~= 0 then
		return false
	elseif sell_playlist.filter_not_null and arg_146_0.price < 10 then
		return false
	else
		return true
	end
end

ffi = require("ffi")

ffi.cdef("\t\n\ttypedef unsigned long DWORD;\n\ttypedef int HCURSOR;\n\ttypedef int BOOL;\n\t\n\ttypedef struct _POINT {\n\t\tint x, y;\n\t} POINT, *PPOINT;\n\t\n\ttypedef struct _CURSORINFO {\n        DWORD   cbSize, flags;\n        HCURSOR hCursor;\n        POINT   ptScreenPos;\n    } CURSORINFO, *LPCURSORINFO;\n\t\n\tBOOL GetCursorInfo(LPCURSORINFO);\n\t\n\tint GetSystemMetrics(int nIndex);\n")

ci = ffi.new("CURSORINFO[1]")
ci[0].cbSize = ffi.sizeof("CURSORINFO")

function isCursorVisible()
	ci[0].cbSize = ffi.sizeof("CURSORINFO")

	if ffi.C.GetCursorInfo(ci) then
		if ci[0].flags == 0 then
			return false
		else
			return true
		end
	end
end

function getScreenResolutionEx()
	local var_148_0, var_148_1 = getScreenResolution()
	local var_148_2 = ffi.C.GetSystemMetrics(0)
	local var_148_3 = ffi.C.GetSystemMetrics(1)

	if var_148_0 < var_148_2 or var_148_1 < var_148_3 then
		return var_148_0, var_148_1
	else
		return var_148_2, var_148_3
	end
end

function getSampVersion()
	local var_149_0 = "unknown"
	local var_149_1 = {
		[3268371] = "R1",
		[834736] = "R4",
		[834704] = "R5",
		[836816] = "R3",
		[1039200] = "DLR1",
		[3249629] = "R2"
	}
	local var_149_2 = getModuleHandle("samp.dll")

	if var_149_2 then
		local var_149_3 = var_149_2 + ffi.cast("long*", var_149_2 + 60)[0]
		local var_149_4 = ffi.cast("uintptr_t*", var_149_3 + 40)

		if var_149_1[var_149_4[0]] then
			var_149_0 = var_149_1[var_149_4[0]]
		end
	end

	return var_149_0
end

local var_0_9 = {}
local var_0_10
local var_0_11 = "int(*)()"
local var_0_12 = "R1"
local var_0_13 = {
	deathWindow = {
		R1 = 736432,
		R3 = 809840
	},
	dialog = {
		R1 = 736432,
		R3 = 809904
	},
	default = {
		R1 = 736352,
		R3 = 809760
	}
}

local function var_0_14(arg_150_0)
	return ffi.cast(var_0_11, var_0_10 + var_0_13[arg_150_0][var_0_12])()
end

function var_0_9.getDialog(arg_151_0)
	return var_0_14("dialog")
end

function var_0_9.getDeathWindow(arg_152_0)
	return var_0_14("deathWindow")
end

function var_0_9.getDefault(arg_153_0)
	return var_0_14("default")
end

setmetatable(var_0_9, {
	__call = function(arg_154_0, arg_154_1)
		var_0_10 = getModuleHandle("samp.dll")
		var_0_12 = arg_154_1 or var_0_12

		return setmetatable(arg_154_0, {
			__index = arg_154_0
		})
	end
})

dialog_font_size = 14
buy_list = {}

ecfg.update(buy_list, filename_buy_list)

buy_dlist = {}

for iter_0_1, iter_0_2 in ipairs(buy_list) do
	buy_dlist[iter_0_2] = true
end

sell_list = {}
right_inv_list = {}

ecfg.update(sell_list, filename_sell_list)

sell_dlist = {}

for iter_0_3, iter_0_4 in ipairs(sell_list) do
	sell_dlist[iter_0_4] = true
end

help = {}

ecfg.update(help, filename_help)

tmp = {}
set = {}
set.paste_mode = "add"
set.color = "default"
set.default_invent = false
set.save_dialog_input = true
set.scale = 100
set.menu_size = {
	w = 800,
	h = 600
}
set.allow_remote = false
set.remote = false
set.remote_camera_speed = 5
set.left_price_value = true
set.small = false
set.small_state = "left"
set.color_menu = 4294967125
set.hello = true
set.to_start = false
set.buy_top = false
set.buy_top_days = 14
set.current_tab = "buy"
set.walk_delay = 40
set.search_delay = 1000
set.show_average = true
set.buy_use_search = true
set.sell_komm = 4
set.sell_komm_vc = 10
set.sell_server_komm = {}
set.sell_server_komm_vc = {}
set.sell_delete = false
set.sell_default_number = 0
set.sell_default_enabled = true
set.current_playlist = "Основной.cfg"
set.scroller_default = false
set.scroller = false
set.scroller_smooth = true
set.scroller_duration = 400
set.buy_sa = 100
set.buy_vc = 100
set.av_konverter = false
set.av_pricekom = false
set.av_kurs = {}

ecfg.update(set, filename_set)
apply_default_style()

set.buy_default_number = 1
set.buy_default_price = 0
set.buy_default_enabled = true
set.buy_default_auto_number = true
set.sell_default_price = 0
set.left_price_value = true
set.sell_default_maximum = true

if set.menu_pos then
	local var_0_15, var_0_16 = getScreenResolutionEx()

	if var_0_15 < set.menu_size.w then
		set.menu_size.w = var_0_15
	end

	if var_0_16 < set.menu_size.h then
		set.menu_size.h = var_0_16
	end

	if set.menu_pos.x < 0 then
		set.menu_pos.x = 0
	end

	if set.menu_pos.y < 0 then
		set.menu_pos.y = 0
	end

	if var_0_15 < set.menu_pos.x + set.menu_size.w then
		set.menu_pos.x = var_0_15 - set.menu_size.w
	end

	if var_0_16 < set.menu_pos.y + set.menu_size.h then
		set.menu_pos.y = var_0_16 - set.menu_size.h
	end
end

if not set.menu_pos then
	local var_0_17, var_0_18 = getScreenResolutionEx()

	set.menu_pos = {
		x = var_0_17 / 2 - set.menu_size.w / 2,
		y = var_0_18 / 2 - set.menu_size.h / 2
	}

	ecfg.save(filename_set, set)
end

set.dynamic = false

apply_custom_style(set.color_menu, 2, true)

uncollapse = false
img = {}
img.window_info_dialg = imgui.ImBool(false)
img.info_dialog_buffer = imgui.ImBuffer(256)
img.ignore_ver = imgui.ImBool(false)
img.window_menu = imgui.ImBool(false)
img.window_buy_average = imgui.ImBool(false)
img.window_sell_average = imgui.ImBool(false)
img.allow_remote = imgui.ImBool(set.allow_remote)
img.left_price_value = imgui.ImBool(set.left_price_value)
img.save_dialog_input = imgui.ImBool(set.save_dialog_input)
img.small = imgui.ImBool(set.small)
img.remote_camera_speed = imgui.ImInt(set.remote_camera_speed)

local var_0_19, var_0_20, var_0_21, var_0_22 = explode_argb(set.color_menu)

img.color_menu = imgui.ImFloat4(var_0_20, var_0_21, var_0_22, var_0_19)
img.buy_sa = imgui.ImInt(set.buy_sa)
img.buy_vc = imgui.ImInt(set.buy_vc)
img.buy_price_is_ready = imgui.ImBool(false)
img.av_konverter = imgui.ImBool(set.av_konverter)
img.av_pricekom = imgui.ImBool(set.av_pricekom)
img.scroller_duration = imgui.ImInt(set.scroller_duration)
img.hello = imgui.ImBool(set.hello)
img.walk_delay = imgui.ImInt(set.walk_delay)
img.scale = imgui.ImInt(set.scale)
img.search_delay = imgui.ImInt(set.search_delay)
img.show_average = imgui.ImBool(set.show_average)
img.to_start = imgui.ImBool(set.to_start)
img.buy_top = imgui.ImBool(set.buy_top)
img.buy_top_days = imgui.ImInt(set.buy_top_days)
img.buy_default_number = imgui.ImInt(set.buy_default_number)
img.buy_default_price = imgui.ImInt(set.buy_default_price)
img.buy_default_enabled = imgui.ImBool(set.buy_default_enabled)
img.buy_default_auto_number = imgui.ImBool(set.buy_default_auto_number)
img.buy_use_search = imgui.ImBool(set.buy_use_search)
img.sell_komm = imgui.ImInt(set.sell_komm)
img.sell_komm_vc = imgui.ImInt(set.sell_komm_vc)
img.sell_delete = imgui.ImBool(set.sell_delete)
img.sell_default_maximum = imgui.ImBool(set.sell_default_maximum)
img.sell_default_number = imgui.ImInt(set.sell_default_number)
img.sell_default_price = imgui.ImInt(set.sell_default_price)
img.sell_default_enabled = imgui.ImBool(set.sell_default_enabled)
img.search_buffer3 = imgui.ImBuffer(256)
img.search_buffer = imgui.ImBuffer(256)
img.search_buffer2 = imgui.ImBuffer(256)
img.create_buffer = imgui.ImBuffer(256)
img.about_buffer = imgui.ImBuffer(u8("---------- Подсказки ----------\n- Чтобы посмотреть средние цены нажмите и удерживайте левую кнопку мышки на названии товара,\nв правой части интерфеса.\n\n- Чтобы перевести $ в VC$ нажмите на название плейлиста,  по умолчанию это < Основной >,\nдальше выберите соответствующий пункт. Тут же есть и другие важные функции,\nтакие как создание нового плейлиста, очистка, копирование и прочее.\n\n---------- Папка плейлистов на скупку ----------\n" .. directory_buy .. "\n\n---------- Папка плейлистов на продажу ----------\n" .. directory_sell .. "\n\n---------- Папка средних цен на скупку ----------\n" .. directory_buy_average .. "\n\n---------- Папка средних цен на продажу ----------\n" .. directory_sell_average .. "\n\n---------- Файл всех товаров ----------\n" .. filename_buy_list .. "\n\n---------- Файлы моих товаров ----------\n" .. filename_sell_list .. "\n" .. filename_sell_number_dict .. "\n" .. filename_sell_name_dict .. "\n\n---------- Файл настроек ----------\n" .. filename_set .. "\n\n---------- Автор ----------\n" .. __author__ .. "\n\nTelegram:\n" .. __telegram__ .. "\n\nDiscord:\n" .. __discord__ .. "\n\nEmail:\n" .. __email__))

load_current_playlist()
create_playlist("Основной", false)

playlist_renaming = false
playlist_renaming_focus = false
buy_do_refresh_list = true
buy_draw_list = {}
buy_playlist_info = {}
buy_do_refresh_top_draw_list = true
buy_top_draw_list = {}
buy_do_refresh_right_draw_list = true
buy_right_draw_list = {}
sell_do_refresh_left_draw_list = true
sell_left_draw_list = {}
sell_playlist_info = {}
sell_do_refresh_right_draw_list = true
sell_right_draw_list = {}
fatality = false
buy_dubl = {}
buy_task = {}
buy_parsing = false
buy_running = false
buy_running_back = false
buy_cancel = false
buy_right_scroll = nil
auto_number_task = {}
auto_number_dict = ecfg.table_load(filename_auto_number_dict, true) or {}
buy_current_moving_item = nil
buy_task_removed_item = nil
sell_dubl = {}
sell_task = {}
sell_number_dict = {}
sell_name_dict = {}
sell_vystavit = false

ecfg.update(sell_name_dict, filename_sell_name_dict)
ecfg.update(sell_number_dict, filename_sell_number_dict)

sell_parsing = false
sell_parsing2 = false
sell_right_scroll = nil
sell_current_moving_item = nil
any_dialog_clock = nil
search_dialog_clock = nil

function smart_wait(arg_155_0, arg_155_1)
	if arg_155_1 then
		local var_155_0 = arg_155_0 - (os.clock() - arg_155_1) * 1000

		if var_155_0 > 0 then
			wait(var_155_0)
		else
			wait(0)
		end
	else
		wait(arg_155_0)
	end
end

md5 = require("md5")

function search_nickname_or_nomerok(arg_156_0)
	local var_156_0 = u8:decode(img.search_buffer3.v)

	if arg_156_0:find(var_156_0, 1, true) then
		return true
	end

	for iter_156_0, iter_156_1 in ipairs(nomerki[arg_156_0]) do
		if iter_156_1.nick:lower():find(var_156_0:lower(), 1, true) or iter_156_1.server:lower():find(var_156_0:lower(), 1, true) then
			return true
		end
	end
end

sell_average_price = {}
sell_average_to_send = {}
upload_items = {}
upload_task = {}
buy_average_price = {}
buy_average_to_send = {}
EXPORTS.buy_average_price = buy_average_price
EXPORTS.sell_average_price = sell_average_price
average_index = nil
average_dubl = {}
sell_average_parsing = false
sell_average_parsing_all = false
buy_average_parsing = false
buy_average_parsing_all = false
sbros_inv = false

function time_to_str(arg_157_0)
	if arg_157_0 then
		local var_157_0 = os.date("*t", arg_157_0)

		var_157_0.hour = var_157_0.hour

		return os.date("%Y-%m-%d | %H:%M", arg_157_0)
	end
end

function get_msc_time()
	local var_158_0 = os.date("!*t")

	var_158_0.hour = var_158_0.hour + 3

	return os.time(var_158_0)
end

function check_date(arg_159_0, arg_159_1)
	local var_159_0 = os.date("!*t")

	var_159_0.hour = var_159_0.hour + 3
	var_159_0.day = var_159_0.day - (set.buy_top_days - 1)
	var_159_0.hour = nil
	var_159_0.min = nil
	var_159_0.sec = nil

	local var_159_1 = os.time(var_159_0)
	local var_159_2, var_159_3, var_159_4 = arg_159_0:match("(%d%d%d%d)%-(%d%d)%-(%d%d)")
	local var_159_5 = tonumber(var_159_2)
	local var_159_6 = tonumber(var_159_3)
	local var_159_7 = tonumber(var_159_4)
	local var_159_8 = {
		year = var_159_5,
		month = var_159_6,
		day = var_159_7
	}

	return var_159_1 <= os.time(var_159_8)
end

function str_to_time(arg_160_0)
	local var_160_0, var_160_1, var_160_2 = arg_160_0:match("(%d%d%d%d)%-(%d%d)%-(%d%d)")
	local var_160_3 = tonumber(var_160_0)
	local var_160_4 = tonumber(var_160_1)
	local var_160_5 = tonumber(var_160_2)
	local var_160_6 = {
		year = var_160_3,
		month = var_160_4,
		day = var_160_5
	}

	return (os.time(var_160_6))
end

function refresh_buy_top_list()
	buy_top_list = {}
	buy_top_rank = {}

	local var_161_0 = getArizonaName()

	if buy_average_price[var_161_0] and sell_average_price[var_161_0] then
		for iter_161_0, iter_161_1 in pairs(buy_average_price[var_161_0]) do
			if sell_average_price[var_161_0][iter_161_0] then
				local var_161_1 = 0
				local var_161_2 = 0
				local var_161_3 = 0
				local var_161_4 = 0

				for iter_161_2, iter_161_3 in ipairs(iter_161_1.list) do
					if check_date(iter_161_3[1], iter_161_0) then
						var_161_1 = var_161_1 + iter_161_3[4]
						var_161_3 = var_161_3 + 1
					end
				end

				for iter_161_4, iter_161_5 in ipairs(sell_average_price[var_161_0][iter_161_0].list) do
					if check_date(iter_161_5[1], iter_161_0) then
						var_161_2 = var_161_2 + iter_161_5[4]
						var_161_4 = var_161_4 + 1
					end
				end

				if var_161_3 ~= 0 and var_161_4 ~= 0 then
					local var_161_5 = var_161_1 / var_161_3
					local var_161_6 = var_161_2 / var_161_4

					table.insert(buy_top_list, iter_161_0)

					buy_top_rank[iter_161_0] = math.floor(math.min(var_161_5, var_161_6))
				end
			end
		end

		table.sort(buy_top_list, function(arg_162_0, arg_162_1)
			return buy_top_rank[arg_162_0] > buy_top_rank[arg_162_1]
		end)
	end

	buy_do_refresh_top_draw_list = true
end

button_width = 240
button_heigth = 35
playlists = {}

refresh_playlists()

copy_buffer = nil
copy_buffer2 = nil
CONTROLLABLE = true

function sampev.onTogglePlayerControllable(arg_163_0)
	CONTROLLABLE = arg_163_0
end

function sampev.onServerMessage(arg_164_0, arg_164_1)
	local var_164_0 = arg_164_1:gsub("{%x%x%x%x%x%x}", "")

	if var_164_0:match("^%[Ошибка%] У вас нет выставленного товара") and (buy_cancel or sell_cancel) then
		buy_cancel = false
		sell_cancel = false
		img.window_menu.v = true
	end

	if var_164_0:match("^%[Ошибка%] Данные товары запрещено продавать не в Центре Гетто!") then
		right_next = true
	end

	if var_164_0:match("^%[Ошибка%] Поиск доступен") then
		-- block empty
	end

	if var_164_0:match("^%[Ошибка%] Предметов не найдено!") then
		if buy_running then
			buy_task_removed_item = table.remove(buy_task, 1)

			if set.hello then
				sampAddChatMessage("• {FF8888}[" .. MAIN_TITLE .. "] {FFFFFF}Товар на скупку не найден: \"" .. buy_task_removed_item.name, 16777215)
			end
		elseif auto_number_checking then
			local var_164_1 = table.remove(auto_number_task, 1)

			if set.hello and var_164_1 then
				sampAddChatMessage("• {C80000}[" .. MAIN_TITLE .. "] {FFFFFF}Товар не найден: " .. var_164_1.name, 16777215)
			end

			buy_do_refresh_right_draw_list = true
		end
	end

	local var_164_2, var_164_3, var_164_4, var_164_5 = var_164_0:match("^Вы купили (.+) %((.+) шт%.%) у игрока (.+) за V?C?$(.+)$")

	if not var_164_2 then
		local var_164_6

		var_164_2, var_164_6, var_164_5 = var_164_0:match("^Вы купили (.+) у игрока (.+) за V?C?$(.+)$")
		var_164_3 = "1"
	end

	if var_164_2 then
		local var_164_7 = var_164_3:gsub("%D", "")
		local var_164_8 = tonumber(var_164_7)
		local var_164_9 = var_164_5:gsub("%D", "")
		local var_164_10 = tonumber(var_164_9)

		for iter_164_0, iter_164_1 in ipairs(buy_playlist) do
			if var_164_2 == iter_164_1.name then
				iter_164_1.number_dynamic = math.max(iter_164_1.number_dynamic - var_164_8, 0)
				img.buy_playlist[iter_164_0].number_dynamic.v = iter_164_1.number_dynamic

				ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, iter_164_0, iter_164_1)
			end
		end

		table.insert(upload_items, {
			order = 1,
			deal = "buy",
			server = safe_server(getArizonaName()),
			name = var_164_2,
			number = var_164_8,
			price = var_164_10
		})

		upload_clock = upload_clock or os.clock()
		buy_do_refresh_right_draw_list = true
	end

	local var_164_11, var_164_12, var_164_13, var_164_14, var_164_15 = var_164_0:match("^(.+) купил у вас (.+) %((.+) шт%.%), вы получили V?C?$(.+) от продажи %(комиссия (.+) процент%(а%)%)$")
	local var_164_16 = true

	if not var_164_12 then
		local var_164_17

		var_164_17, var_164_12, var_164_14, var_164_15 = var_164_0:match("^(.+) купил у вас (.+), вы получили V?C?$(.+) от продажи %(комиссия (.+) процент%(а%)%)$")
		var_164_13 = "1"
		var_164_16 = false
	end

	if var_164_12 then
		local var_164_18 = var_164_13:gsub("%D", "")
		local var_164_19 = tonumber(var_164_18)
		local var_164_20 = var_164_14:gsub("%D", "")
		local var_164_21 = tonumber(var_164_20)
		local var_164_22 = var_164_15:gsub("%D", "")
		local var_164_23 = tonumber(var_164_22)

		if var_164_16 then
			var_164_21 = math.ceil(var_164_21 / (100 - var_164_23) * 100)
		end

		for iter_164_2, iter_164_3 in ipairs(sell_playlist) do
			if var_164_12 == iter_164_3.name then
				iter_164_3.number_dynamic = math.max(iter_164_3.number_dynamic - var_164_19, 0)
				img.sell_playlist[iter_164_2].number_dynamic.v = iter_164_3.number_dynamic

				ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, iter_164_2, iter_164_3)
			end
		end

		table.insert(upload_items, {
			order = 1,
			deal = "sell",
			server = safe_server(getArizonaName()),
			name = var_164_12,
			number = var_164_19,
			price = var_164_21
		})

		upload_clock = upload_clock or os.clock()
		sell_do_refresh_right_draw_list = true
	end
end

function sampev.onShowDialog(arg_165_0, arg_165_1, arg_165_2, arg_165_3, arg_165_4, arg_165_5)
	wait_textdraw_clock = nil
	right_clicking = false
	img.window_info_dialg.v = false
	any_dialog_clock = os.clock()

	if alt_thread then
		alt_thread:terminate()
	end

	local var_165_0 = table.concat({
		arg_165_0,
		arg_165_1,
		arg_165_2,
		arg_165_3,
		arg_165_4,
		arg_165_5
	}, ", ")

	same_dialog = var_165_0 == last_dialog
	last_dialog = var_165_0
	wait_dialog_clock = nil

	local var_165_1 = arg_165_2:gsub("{%x%x%x%x%x%x}", "")
	local var_165_2 = arg_165_5:gsub("{%x%x%x%x%x%x}", "")
	local var_165_3 = arg_165_3:gsub("{%x%x%x%x%x%x}", "")
	local var_165_4 = arg_165_4:gsub("{%x%x%x%x%x%x}", "")
	local var_165_5 = var_165_2:gsub("^[^\r\n]+[\r\n]", "")

	if not var_165_2:find("Примерить предмет", 1, true) and (var_165_1 == "Покупка предмета" or var_165_1 == "Продажа предмета" or var_165_1 == "Информация о предмете" or var_165_1 == "Снятие с продажи") and set.show_average then
		info_dialog = {
			arg_165_0,
			arg_165_2,
			arg_165_5,
			arg_165_3,
			arg_165_4,
			arg_165_1,
			id = arg_165_0,
			title = arg_165_2,
			ctitle = var_165_1,
			text = arg_165_5,
			ctext = var_165_2:gsub("\r\n", "\n"),
			button1 = var_165_3,
			button0 = var_165_4,
			style = arg_165_1
		}

		if not set.save_dialog_input then
			img.info_dialog_buffer.v = ""
		end

		focus_info_dialog = true
		restore_info_dialog = true
		img.window_info_dialg.v = true

		return
	end

	if var_165_1:find("Личные настройки", 1, true) and sbros_inv then
		local var_165_6 = 0

		for iter_165_0 in var_165_5:gmatch("[^\r\n]+") do
			if iter_165_0:find("Настройки инвентаря", 1, true) then
				lua_thread.create(function()
					while pause do
						wait(0)
					end

					smart_wait(set.walk_delay, any_dialog_clock)
					sampSendDialogResponse(arg_165_0, 1, var_165_6, "")
				end)

				break
			end

			var_165_6 = var_165_6 + 1
		end
	end

	if var_165_1:find("Настройки инвентаря", 1, true) and sbros_inv then
		local var_165_7 = 0

		for iter_165_1 in var_165_5:gmatch("[^\r\n]+") do
			if iter_165_1:find("Сбросить настройки инвентаря", 1, true) then
				lua_thread.create(function()
					while pause do
						wait(0)
					end

					smart_wait(set.walk_delay, any_dialog_clock)
					sampSendDialogResponse(arg_165_0, 1, var_165_7, "")
				end)

				set.default_invent = true

				ecfg.save(filename_set, set)

				break
			end

			var_165_7 = var_165_7 + 1
		end

		sbros_inv = false
	end

	if var_165_1:match("Выберите действие", 1, true) and (buy_running or auto_number_checking) then
		lua_thread.create(function()
			while pause do
				wait(0)
			end

			smart_wait(set.walk_delay, any_dialog_clock)
			sampSendDialogResponse(arg_165_0, 1, 0, "")
		end)
	end

	if var_165_2:match("Введите количеств.? и цену за один товар %( (.+) %)", 1, true) then
		if auto_number_checking then
			local var_165_8 = auto_number_task[1]

			lua_thread.create(function()
				while pause do
					wait(0)
				end

				smart_wait(set.walk_delay, any_dialog_clock)

				local var_169_0 = var_165_2:match("%( (.+) %)")

				if var_169_0 then
					auto_number_dict[var_169_0] = "number_and_price"

					ecfg.table_set(filename_auto_number_dict, var_169_0, "number_and_price")
				end

				table.remove(auto_number_task, 1)
				sampSendDialogResponse(arg_165_0, 0, 0, "")
			end)
		elseif buy_running then
			numberprice = numberprice + 1

			local var_165_9 = buy_task[1]

			last_item = var_165_9

			lua_thread.create(function()
				while pause do
					wait(0)
				end

				smart_wait(set.walk_delay, any_dialog_clock)

				if numberprice == 1 then
					buy_task_removed_item = table.remove(buy_task, 1)

					sampSendDialogResponse(arg_165_0, 1, -1,var_165_9.number .. "," .. var_165_9.price or "")

					wait_dialog_clock = os.clock()
				else
					if set.hello then
						sampAddChatMessage("• {FF8888}[" .. MAIN_TITLE .. "] {FFFFFF}Предмет \"" .. buy_task_removed_item.name .. "\" не удалось выставить. Попробуйте изменить цену/количесто предмета или отключить антивирус.", 16777215)
					end

					buy_running_back = true

					sampSendDialogResponse(arg_165_0, 0, 0, "")
				end
			end)
		end

		if sell_running then
			local var_165_10 = sell_task[1]

			last_item = var_165_10

			lua_thread.create(function()
				while pause do
					wait(0)
				end

				smart_wait(set.walk_delay, any_dialog_clock)

				local var_171_0 = var_165_2:match("%( (.+) %)")

				if var_165_10.name == var_171_0 then
					local var_171_1

					if var_165_10.maximum then
						var_171_1 = sell_last_stack_number
					else
						var_171_1 = math.min(var_165_10.number, sell_last_stack_number)
						var_165_10.number = var_165_10.number - var_171_1
					end

					sell_task_removed_item = var_165_10

					if var_165_10.number < 1 and not var_165_10.maximum then
						table.remove(sell_task, 1)

						if #sell_task == 0 then
							sell_running = false

							sampSendClickTextdraw(65535)

							press_alt = true
						end
					end

					last_dialog_send = {
						arg_165_0,
						1,
						-1,
						var_171_1 .. "," .. var_165_10.price or ""
					}

					sampSendDialogResponse(arg_165_0, 1, -1,var_171_1 .. "," .. var_165_10.price or "")

					right_next = true
				else
					if set.hello then
						sampAddChatMessage("• {FF8888}[" .. MAIN_TITLE .. "] {FFFFFF}Ошибка \"" .. tostring(last_item.name) .. "\". Не тот диалог", 16777215)
					end

					last_dialog_send = {
						arg_165_0,
						0
					}

					sampSendDialogResponse(arg_165_0, 0)

					right_next = true
				end
			end)
		end
	end

	if var_165_2:match("Введите цену за товар %( (.+) %)", 1, true) or var_165_2:find("Введите уровень", 1, true) then
		if auto_number_checking then
			local var_165_11 = auto_number_task[1]

			lua_thread.create(function()
				while pause do
					wait(0)
				end

				smart_wait(set.walk_delay, any_dialog_clock)

				local var_172_0 = var_165_2:match("%( (.+) %)")

				if var_172_0 then
					if var_165_2:find("Введите цену", 1, true) then
						auto_number_dict[var_172_0] = "price"
					elseif var_165_2:find("Введите уровень", 1, true) then
						auto_number_dict[var_172_0] = "level_and_price"
					end

					ecfg.table_set(filename_auto_number_dict, var_172_0, auto_number_dict[var_172_0])
				end

				table.remove(auto_number_task, 1)
				sampSendDialogResponse(arg_165_0, 0, 0, "")
			end)
		elseif buy_running then
			numberprice = numberprice + 1

			local var_165_12 = buy_task[1]

			last_item = var_165_12

			lua_thread.create(function()
				while pause do
					wait(0)
				end

				smart_wait(set.walk_delay, any_dialog_clock)

				if numberprice == 1 then
					var_165_12.number = var_165_12.number - 1
					buy_task_removed_item = var_165_12

					if var_165_12.number < 1 then
						table.remove(buy_task, 1)
					end

					if var_165_2:find("Введите цену", 1, true) then
						sampSendDialogResponse(arg_165_0, 1, -1,tostring(var_165_12.price) or "")

						wait_dialog_clock = os.clock()
					elseif var_165_2:find("Введите уровень", 1, true) then
						sampSendDialogResponse(arg_165_0, 1, -1,tostring(var_165_12.lvl) .. "," .. tostring(var_165_12.price) or "")

						wait_dialog_clock = os.clock()
					end
				else
					if set.hello then
						sampAddChatMessage("• {FF8888}[" .. MAIN_TITLE .. "] {FFFFFF}Предмет \"" .. buy_task_removed_item.name .. "\" не удалось выставить. Попробуйте изменить цену/количесто предмета или отключить антивирус.", 16777215)
					end

					buy_running_back = true

					sampSendDialogResponse(arg_165_0, 0, -1, "")
				end
			end)
		elseif sell_running then
			local var_165_13 = sell_task[1]

			last_item = var_165_13

			lua_thread.create(function()
				while pause do
					wait(0)
				end

				smart_wait(set.walk_delay, any_dialog_clock)

				local var_174_0 = var_165_2:match("%( (.+) %)")

				if var_165_13.name:gsub("%(%+%d+%)", "") == var_174_0 then
					var_165_13.number = var_165_13.number - 1

					if var_165_13.number < 1 and not var_165_13.maximum then
						sell_task_removed_item = table.remove(sell_task, 1)

						if #sell_task == 0 then
							sell_running = false

							sampSendClickTextdraw(65535)

							press_alt = true
						end
					end

					last_dialog_send = {
						arg_165_0,
						1,
						-1,
						tostring(var_165_13.price) or ""
					}

					sampSendDialogResponse(arg_165_0, 1, -1,tostring(var_165_13.price) or "")

					right_next = true
				else
					if set.hello then
						sampAddChatMessage("• {FF8888}[" .. MAIN_TITLE .. "] {FFFFFF}Предмет \"" .. tostring(last_item.name) .. "\". Не тот диалог", 16777215)
					end

					last_dialog_send = {
						arg_165_0,
						0
					}

					sampSendDialogResponse(arg_165_0, 0)

					right_next = true
				end
			end)
		end
	end

	if var_165_2:find("Добавить товар на покупку", 1, true) or var_165_2:find("[3] Добавить товар на покупку", 1, true) then
		if sell_vystavit then
			sell_vystavit = false

			EXPORTS.sell(arg_165_0, arg_165_5, false)
		end

		if buy_cancel then
			lua_thread.create(function()
				while pause do
					wait(0)
				end

				smart_wait(set.walk_delay, any_dialog_clock)
				sampSendDialogResponse(arg_165_0, 1, 3, "Прекратить покупку товара")
			end)
		end

		if auto_number_checking then
			if #auto_number_task > 0 then
				lua_thread.create(function()
					while pause do
						wait(0)
					end

					smart_wait(set.search_delay, search_dialog_clock)
					sampSendDialogResponse(arg_165_0, 1, 2, "Добавить товар на покупку (поиск по предметам)")
				end)

				buy_dubl = {}
			else
				auto_number_checking = false

				calculate_number()

				img.window_menu.v = true
			end
		end

		if buy_parsing then
			lua_thread.create(function()
				while pause do
					wait(0)
				end

				smart_wait(set.walk_delay, any_dialog_clock)
				sampSendDialogResponse(arg_165_0, 1, 1, "Добавить товар на покупку")
			end)
		elseif buy_running then
			if #buy_task > 0 then
				lua_thread.create(function()
					while pause do
						wait(0)
					end

					smart_wait(set.search_delay, search_dialog_clock)

					if set.buy_use_search then
						sampSendDialogResponse(arg_165_0, 1, 2, "Добавить товар на покупку (поиск по предметам)")
					else
						sampSendDialogResponse(arg_165_0, 1, 1, "Добавить товар на покупку")
					end
				end)

				buy_dubl = {}
			else
				buy_running = false
				fatality = true

				if fatality then
					lua_thread.create(function()
						while pause do
							wait(0)
						end

						smart_wait(set.walk_delay, any_dialog_clock)
						sampSendDialogResponse(arg_165_0, 1, 1, "Добавить товар на покупку")
					end)
				end
			end
		end

		if sell_cancel then
			lua_thread.create(function()
				while pause do
					wait(0)
				end

				smart_wait(set.walk_delay, any_dialog_clock)
				sampSendDialogResponse(arg_165_0, 1, 1, "2. Удалить товар с продажи")
			end)
		end

		if sell_parsing then
			lua_thread.create(function()
				while pause do
					wait(0)
				end

				smart_wait(set.walk_delay, any_dialog_clock)
				sampSendDialogResponse(arg_165_0, 1, 0, "1. Выставить товар на продажу")
			end)
		elseif sell_running then
			if #sell_task > 0 then
				lua_thread.create(function()
					while pause do
						wait(0)
					end

					smart_wait(set.walk_delay, any_dialog_clock)
					sampSendDialogResponse(arg_165_0, 1, 0, "1. Выставить товар на продажу")
				end)

				sell_dubl = {}
			else
				sell_running = false
				fatality = true

				if fatality then
					lua_thread.create(function()
						while pause do
							wait(0)
						end

						smart_wait(set.walk_delay, any_dialog_clock)
						sampSendDialogResponse(arg_165_0, 1, 1, "Добавить товар на покупку")
					end)
				end
			end
		end

		return {
			arg_165_0,
			arg_165_1,
			arg_165_2,
			arg_165_3,
			arg_165_4,
			arg_165_5 .. "\n \n{009999}[6] Palatka.lua"
		}
	end

	if var_165_2:find("Название\tСкупаете\tСтоимость", 1, true) then
		numberprice = 0

		if fatality then
			lua_thread.create(function()
				while pause do
					wait(0)
				end

				smart_wait(set.walk_delay, any_dialog_clock)

				fatality = false

				sampSendDialogResponse(arg_165_0, 0, 0, "")
			end)
		end

		if buy_cancel then
			local var_165_14 = 0

			for iter_165_2 in var_165_5:gmatch("[^\r\n]+") do
				if not iter_165_2:match("\t $") and not iter_165_2:match("Предыдущая страница") and not iter_165_2:match("Избранное для") then
					lua_thread.create(function()
						while pause do
							wait(0)
						end

						smart_wait(set.walk_delay, any_dialog_clock)
						sampSendDialogResponse(arg_165_0, 1, var_165_14, "")
					end)

					break
				end

				if iter_165_2:find("Следующая страница", 1, true) then
					lua_thread.create(function()
						while pause do
							wait(0)
						end

						smart_wait(set.walk_delay, any_dialog_clock)
						sampSendDialogResponse(arg_165_0, 1, var_165_14, "")
					end)

					break
				end

				var_165_14 = var_165_14 + 1
			end
		end

		if buy_parsing then
			local var_165_15 = {}

			for iter_165_3 in var_165_5:gmatch("[^\r\n]+") do
				local var_165_16 = iter_165_3:match("^[^\t]+")

				if buy_dubl[var_165_16] then
					buy_dubl[var_165_16] = buy_dubl[var_165_16] + 1

					table.insert(var_165_15, var_165_16 .. " // " .. buy_dubl[var_165_16])
				else
					buy_dubl[var_165_16] = 1

					table.insert(var_165_15, var_165_16)
				end
			end

			var_165_5 = table.concat(var_165_15, "\n")

			local var_165_17 = 0

			for iter_165_4 in var_165_5:gmatch("[^\r\n]+") do
				local var_165_18 = iter_165_4:match("^[^\t]+")

				if var_165_18:find("Следующая страница", 1, true) and arg_165_2:match("Страница (%d+)/%d+") ~= arg_165_2:match("Страница %d+/(%d+)") then
					lua_thread.create(function()
						while pause do
							wait(0)
						end

						smart_wait(set.walk_delay, any_dialog_clock)
						sampSendDialogResponse(arg_165_0, 1, var_165_17, "")
					end)

					break
				end

				if not var_165_18:find("страница", 1, true) and not var_165_18:find("Избранное для", 1, true) then
					table.insert(temp_buy_list, var_165_18)

					temp_buy_dlist[var_165_18] = true
				end

				var_165_17 = var_165_17 + 1
			end

			if arg_165_2:match("Страница (%d+)/%d+") == arg_165_2:match("Страница %d+/(%d+)") then
				buy_parsing = false
				buy_list = temp_buy_list
				buy_dlist = temp_buy_dlist

				ecfg.save(filename_buy_list, buy_list)
				lua_thread.create(function()
					while pause do
						wait(0)
					end

					smart_wait(set.walk_delay, any_dialog_clock)
					sampSendDialogResponse(arg_165_0, 0, 0, "")
				end)

				buy_do_refresh_list = true
				sell_do_refresh_left_draw_list = true
				buy_do_refresh_top_draw_list = true
				set.current_tab = "buy"
				img.window_menu.v = true
			end
		end

		if buy_running_back then
			buy_running_back = false

			lua_thread.create(function()
				while pause do
					wait(0)
				end

				smart_wait(set.walk_delay, any_dialog_clock)
				sampSendDialogResponse(arg_165_0, 0, 0, "")
			end)
		elseif buy_running then
			local var_165_19 = {}

			for iter_165_5 in var_165_5:gmatch("[^\r\n]+") do
				local var_165_20 = iter_165_5:match("^[^\t]+")

				if buy_dubl[var_165_20] then
					buy_dubl[var_165_20] = buy_dubl[var_165_20] + 1

					table.insert(var_165_19, var_165_20 .. " // " .. buy_dubl[var_165_20])
				else
					buy_dubl[var_165_20] = 1

					table.insert(var_165_19, iter_165_5)
				end
			end

			var_165_5 = table.concat(var_165_19, "\n")

			local var_165_21 = 0
			local var_165_22 = false
			local var_165_23 = buy_task[1]

			for iter_165_6 in var_165_5:gmatch("[^\r\n]+") do
				local var_165_24 = iter_165_6:match("^[^\t]+")
				local var_165_25 = iter_165_6:match("^[^\t]+\t[^\t]+\t([^/]+)")

				var_165_25 = var_165_25 and tonumber((var_165_25:gsub("[^%d]", "")))

				local var_165_26 = tonumber(iter_165_6:match("^[^\t]+\t(%d+) шт%.")) or var_165_25 and 1

				if var_165_24:find("Следующая страница", 1, true) then
					lua_thread.create(function()
						while pause do
							wait(0)
						end

						smart_wait(set.walk_delay, any_dialog_clock)
						sampSendDialogResponse(arg_165_0, 1, var_165_21, "")
					end)

					var_165_22 = true

					break
				end

				if not var_165_24:find("страница", 1, true) and var_165_23 then
					local var_165_27

					var_165_27 = var_165_25 and not var_165_26 and var_165_23.price ~= var_165_25

					if var_165_23.name == var_165_24 then
						if var_165_25 ~= var_165_23.price or var_165_26 ~= var_165_23.number then
							if var_165_23.number > 0 then
								lua_thread.create(function()
									while pause do
										wait(0)
									end

									smart_wait(set.walk_delay, any_dialog_clock)
									sampSendDialogResponse(arg_165_0, 1, var_165_21, "")
								end)

								var_165_22 = true

								break
							end
						else
							table.remove(buy_task, 1)

							var_165_22 = true

							if #buy_task < 1 then
								lua_thread.create(function()
									while pause do
										wait(0)
									end

									smart_wait(set.walk_delay, any_dialog_clock)
									sampSendDialogResponse(arg_165_0, 0, 0, "")
								end)
							end
						end
					end
				end

				var_165_21 = var_165_21 + 1
			end

			if not var_165_22 then
				table.remove(buy_task, 1)
				sampSendDialogResponse(arg_165_0, 0, 0, "")
			end
		end
	end

	if var_165_1:find("Поиск товара") and var_165_2:find("Введите") then
		if auto_number_checking then
			if same_dialog then
				search_dialog_clock = os.clock()

				sampSendDialogResponse(arg_165_0, 0, -1, "")

				press_alt = true

				return
			end

			local var_165_28 = auto_number_task[1]

			if var_165_28 then
				lua_thread.create(function()
					while pause do
						wait(0)
					end

					smart_wait(set.walk_delay, any_dialog_clock)
					sampSendDialogResponse(arg_165_0, 1, -1, var_165_28.name:gsub(" // %d+$", ""))
				end)
			else
				sampSendDialogResponse(arg_165_0, 0, -1, "")

				press_alt = true
			end
		elseif buy_running then
			if same_dialog then
				search_dialog_clock = os.clock()

				sampSendDialogResponse(arg_165_0, 0, -1, "")

				press_alt = true

				return
			end

			if set.buy_use_search then
				local var_165_29 = buy_task[1]

				lua_thread.create(function()
					while pause do
						wait(0)
					end

					smart_wait(set.walk_delay, any_dialog_clock)
					sampSendDialogResponse(arg_165_0, 1, -1, var_165_29.name:gsub(" // %d+$", ""))
				end)
			end
		end
	elseif var_165_1:find("Поиск товара") then
		search_dialog_clock = os.clock()

		if auto_number_checking then
			numberprice = 0

			local var_165_30 = {}

			for iter_165_7 in var_165_2:gmatch("[^\r\n]+") do
				local var_165_31 = iter_165_7:gsub("^%d+%. ", "")

				if buy_dubl[var_165_31] then
					buy_dubl[var_165_31] = buy_dubl[var_165_31] + 1

					table.insert(var_165_30, var_165_31 .. " // " .. buy_dubl[var_165_31])
				else
					buy_dubl[var_165_31] = 1

					table.insert(var_165_30, var_165_31)
				end
			end

			var_165_2 = table.concat(var_165_30, "\n")

			local var_165_32 = 0
			local var_165_33 = false
			local var_165_34 = auto_number_task[1]

			for iter_165_8 in var_165_2:gmatch("[^\r\n]+") do
				local var_165_35 = iter_165_8

				if var_165_35:find("Следующая страница", 1, true) then
					lua_thread.create(function()
						while pause do
							wait(0)
						end

						smart_wait(set.walk_delay, any_dialog_clock)
						sampSendDialogResponse(arg_165_0, 1, var_165_32, "")
					end)

					var_165_33 = true

					break
				end

				if not var_165_35:find("страница", 1, true) and var_165_34 and var_165_34.name == var_165_35 then
					lua_thread.create(function()
						while pause do
							wait(0)
						end

						smart_wait(set.walk_delay, any_dialog_clock)
						sampSendDialogResponse(arg_165_0, 1, var_165_32, "")
					end)

					var_165_33 = true

					break
				end

				var_165_32 = var_165_32 + 1
			end

			if not var_165_33 then
				table.remove(auto_number_task, 1)
				lua_thread.create(function()
					while pause do
						wait(0)
					end

					smart_wait(set.walk_delay, any_dialog_clock)
					sampSendDialogResponse(arg_165_0, 0, 0, "")
					smart_wait(set.walk_delay, any_dialog_clock)

					if is_lavka() then
						press_alt = true
					end
				end)
			end
		elseif buy_running then
			numberprice = 0

			local var_165_36 = {}

			for iter_165_9 in var_165_2:gmatch("[^\r\n]+") do
				local var_165_37 = iter_165_9:gsub("^%d+%. ", "")

				if buy_dubl[var_165_37] then
					buy_dubl[var_165_37] = buy_dubl[var_165_37] + 1

					table.insert(var_165_36, var_165_37 .. " // " .. buy_dubl[var_165_37])
				else
					buy_dubl[var_165_37] = 1

					table.insert(var_165_36, var_165_37)
				end
			end

			var_165_2 = table.concat(var_165_36, "\n")

			local var_165_38 = 0
			local var_165_39 = false
			local var_165_40 = buy_task[1]

			for iter_165_10 in var_165_2:gmatch("[^\r\n]+") do
				local var_165_41 = iter_165_10

				if var_165_41:find("Следующая страница", 1, true) then
					lua_thread.create(function()
						while pause do
							wait(0)
						end

						smart_wait(set.walk_delay, any_dialog_clock)
						sampSendDialogResponse(arg_165_0, 1, var_165_38, "")
					end)

					var_165_39 = true

					break
				end

				if not var_165_41:find("страница", 1, true) and var_165_40 and var_165_40.name == var_165_41 and var_165_40.number > 0 then
					lua_thread.create(function()
						while pause do
							wait(0)
						end

						smart_wait(set.walk_delay, any_dialog_clock)
						sampSendDialogResponse(arg_165_0, 1, var_165_38, "")
					end)

					var_165_39 = true

					break
				end

				var_165_38 = var_165_38 + 1
			end

			if not var_165_39 then
				table.remove(buy_task, 1)
				lua_thread.create(function()
					while pause do
						wait(0)
					end

					smart_wait(set.walk_delay, any_dialog_clock)
					sampSendDialogResponse(arg_165_0, 0, 0, "")
					smart_wait(set.walk_delay, any_dialog_clock)

					if is_lavka() then
						press_alt = true
					end
				end)
			end
		end
	end

	if var_165_2:find("Название\tВ наличии\tВ продаже\tСтоимость", 1, true) then
		numberprice = 0

		if sell_cancel then
			local var_165_42 = 0

			for iter_165_11 in var_165_5:gmatch("[^\r\n]+") do
				if not iter_165_11:match("\t $") and not iter_165_11:match("Предыдущая страница") then
					lua_thread.create(function()
						while pause do
							wait(0)
						end

						smart_wait(set.walk_delay, any_dialog_clock)
						sampSendDialogResponse(arg_165_0, 1, var_165_42, "")
					end)

					break
				end

				if iter_165_11:find("Следующая страница", 1, true) then
					lua_thread.create(function()
						while pause do
							wait(0)
						end

						smart_wait(set.walk_delay, any_dialog_clock)
						sampSendDialogResponse(arg_165_0, 1, var_165_42, "")
					end)

					break
				end

				var_165_42 = var_165_42 + 1
			end
		end

		if sell_parsing then
			local var_165_43 = 0

			for iter_165_12 in var_165_5:gmatch("[^\r\n]+") do
				local var_165_44 = iter_165_12:match("^([^\t]+)")
				local var_165_45 = tonumber(iter_165_12:match("^[^\t]+\t(%d+) шт%.")) or 1

				sell_number_dict[var_165_44] = (sell_number_dict[var_165_44] or 0) + var_165_45

				if var_165_44:find("Следующая страница", 1, true) then
					lua_thread.create(function()
						while pause do
							wait(0)
						end

						smart_wait(set.walk_delay, any_dialog_clock)
						sampSendDialogResponse(arg_165_0, 1, var_165_43, "")
					end)

					break
				end

				if not var_165_44:find("страница", 1, true) and not sell_dlist[var_165_44] then
					table.insert(sell_list, var_165_44)
					ecfg.append(filename_sell_list, var_165_44)

					sell_dlist[var_165_44] = true
				end

				var_165_43 = var_165_43 + 1
			end

			if not var_165_5:find("Следующая страница", 1, true) then
				sell_parsing = false

				ecfg.save(filename_sell_number_dict, sell_number_dict)
				lua_thread.create(function()
					while pause do
						wait(0)
					end

					smart_wait(set.walk_delay, any_dialog_clock)
					sampSendDialogResponse(arg_165_0, 0, 0, "")
				end)

				img.window_menu.v = true
			end
		end

		if sell_running_back then
			sell_running_back = false

			lua_thread.create(function()
				while pause do
					wait(0)
				end

				smart_wait(set.walk_delay, any_dialog_clock)
				sampSendDialogResponse(arg_165_0, 0, 0, "")
			end)
		elseif sell_running then
			-- block empty
		end
	end

	if var_165_1:find("Основная статистика", 1, true) and sell_parsing2 then
		lua_thread.create(function()
			while pause do
				wait(0)
			end

			smart_wait(set.walk_delay, any_dialog_clock)
			sampSendDialogResponse(arg_165_0, 1, -1, "")
		end)
	end

	if (var_165_2:find("%[слот%] Название\tКоличество") or var_165_2:find("Инвентарь:")) and sell_parsing2 then
		local var_165_46 = 0

		for iter_165_13 in var_165_5:gmatch("[^\r\n]+") do
			local var_165_47, var_165_48 = iter_165_13:match("^%[(%d+)%] ([^\t]+)")

			if var_165_48 then
				local var_165_49 = tonumber(iter_165_13:match("^%[%d+%] [^\t]+\t[%[{](%d+) ")) or 1

				sell_number_dict[var_165_48] = (sell_number_dict[var_165_48] or 0) + var_165_49

				local var_165_50 = tonumber(var_165_47) + 1
				local var_165_51 = var_165_50 % 36 == 0 and 36 or var_165_50 % 36

				table.insert(right_inv_list, {
					name = var_165_48,
					pos = var_165_51,
					invpos = var_165_50,
					number = var_165_49,
					page = math.ceil(var_165_50 / 36)
				})

				if not sell_skip[var_165_48] then
					table.insert(sell_list, var_165_48)

					sell_skip[var_165_48] = true
				end

				local var_165_52 = var_165_48:gsub("%(%+%d+%)", "")

				if not sell_name_dict[var_165_52] then
					sell_name_dict[var_165_52] = {}
				end

				table.insert(sell_name_dict[var_165_52], var_165_48)
			end

			if iter_165_13:match("Следующая страница") or iter_165_13:match("Следующая") or iter_165_13:match(">>") then
				lua_thread.create(function()
					while pause do
						wait(0)
					end

					smart_wait(set.walk_delay, any_dialog_clock)
					sampSendDialogResponse(arg_165_0, 1, var_165_46, iter_165_13:gsub("%s+$", ""))
				end)

				return
			end

			var_165_46 = var_165_46 + 1
		end

		if not var_165_2:match("Следующая страница") and not var_165_2:match("Следующая") and not var_165_2:match(">>") then
			ecfg.save(filename_sell_list, sell_list)
			ecfg.save(filename_sell_number_dict, sell_number_dict)
			ecfg.save(filename_sell_name_dict, sell_name_dict)

			sell_do_refresh_left_draw_list = true
			sell_do_refresh_right_draw_list = true

			lua_thread.create(function()
				while pause do
					wait(0)
				end

				smart_wait(set.walk_delay, any_dialog_clock)
				sampCloseCurrentDialogWithButton(0)
				smart_wait(set.walk_delay, any_dialog_clock)

				if is_lavka() then
					press_alt = true
				end

				sell_parsing2 = false

				if not sell_vystavit then
					img.window_menu.v = true
				end
			end)

			return
		end
	end

	if var_165_2:find("Средние цены товаров при продаже") then
		if buy_average_parsing then
			lua_thread.create(function()
				while pause do
					wait(0)
				end

				smart_wait(set.walk_delay, any_dialog_clock)
				sampSendDialogResponse(arg_165_0, 1, 1, "")
			end)
		end

		return {
			arg_165_0,
			arg_165_1,
			arg_165_2,
			arg_165_3,
			arg_165_4,
			arg_165_5 .. "\n \n{009999}Palatka.lua"
		}
	end

	if var_165_1:find("Средняя цена товаров при продаже", 1, true) then
		if sell_average_parsing and arg_165_5 == last_average_dialog_text then
			sell_average_parsing = false

			local var_165_53 = getArizonaName()

			sell_average_price[var_165_53] = sell_average_price[var_165_53] or {}

			ecfg.save(directory_sell_average .. "\\" .. var_165_53 .. ".cfg", sell_average_price[var_165_53])
			refresh_buy_top_list()

			if set.hello then
				sampAddChatMessage("• {00BB00}[" .. MAIN_TITLE .. "] {FFFFFF}Средние цены продажи обновлены!", 16777215)
			end

			if save_json(directory_sell_average_upload .. "\\" .. var_165_53 .. ".json", encodeJson(sell_average_to_send)) then
				upload_average("sell", var_165_53, directory_sell_average_upload .. "\\" .. var_165_53 .. ".json")
			elseif set.hello then
				sampAddChatMessage("• {FF8888}[" .. MAIN_TITLE .. "] {FFFFFF}Не удалось сохранить файл: " .. directory_sell_average_upload .. "\\" .. var_165_53 .. ".json", 16777215)
			end

			lua_thread.create(function()
				while pause do
					wait(0)
				end

				smart_wait(set.walk_delay, any_dialog_clock)
				sampSendDialogResponse(arg_165_0, 0, 0, "")
			end)
		elseif sell_average_parsing then
			local var_165_54 = 0

			for iter_165_14 in var_165_5:gmatch("[^\r\n]+") do
				local var_165_55 = iter_165_14:match("^[^\t]+")

				if not var_165_55:find("страница", 1, true) then
					average_index = average_index or var_165_54

					if var_165_54 == average_index then
						if (sell_average_parsing_all or sell_dplaylist[var_165_55]) and not average_dubl[var_165_55] then
							lua_thread.create(function()
								while pause do
									wait(0)
								end

								smart_wait(set.walk_delay, any_dialog_clock)
								sampSendDialogResponse(arg_165_0, 1, average_index, "")

								average_index = average_index + 1
							end)

							return
						else
							average_index = average_index + 1
						end
					end
				end

				var_165_54 = var_165_54 + 1
			end

			last_average_dialog_text = arg_165_5
			average_index = nil

			lua_thread.create(function()
				while pause do
					wait(0)
				end

				smart_wait(set.walk_delay, any_dialog_clock)
				sampSendDialogResponse(arg_165_0, 1, 1, "")
			end)
		end
	end

	local var_165_56 = var_165_1:match("Продажа товара '(.-)'", 1, true)

	if var_165_2:match("не найдено ни одной операции с этим товаром") then
		lua_thread.create(function()
			while pause do
				wait(0)
			end

			smart_wait(set.walk_delay, any_dialog_clock)
			sampSendDialogResponse(arg_165_0, 1, 0, "")
		end)
	elseif var_165_56 and sell_average_parsing then
		local var_165_57 = getArizonaName()

		sell_average_price[var_165_57] = sell_average_price[var_165_57] or {}
		sell_average_price[var_165_57][var_165_56] = {}

		for iter_165_15 in var_165_5:gmatch("[^\r\n]+") do
			local var_165_58, var_165_59, var_165_60 = iter_165_15:match("(.+)\t(.+)\t(.+)")
			local var_165_61 = var_165_60:gsub("[^%d]", "")
			local var_165_62 = tonumber(var_165_61)
			local var_165_63 = tonumber(var_165_59)

			table.insert(sell_average_price[var_165_57][var_165_56], {
				var_165_58,
				var_165_63,
				var_165_62
			})
		end

		sell_average_to_send[var_165_56] = sell_average_price[var_165_57][var_165_56]
		sell_average_price[var_165_57].update_time = sell_average_price[var_165_57].update_time or {}
		sell_average_price[var_165_57].update_time[var_165_56] = get_msc_time()

		lua_thread.create(function()
			while pause do
				wait(0)
			end

			smart_wait(set.walk_delay, any_dialog_clock)
			sampSendDialogResponse(arg_165_0, 1, 0, "")
		end)
	end

	if var_165_1:find("Средняя цена товаров при скупке", 1, true) then
		if buy_average_parsing and arg_165_5 == last_average_dialog_text then
			buy_average_parsing = false

			local var_165_64 = getArizonaName()

			buy_average_price[var_165_64] = buy_average_price[var_165_64] or {}

			ecfg.save(directory_buy_average .. "\\" .. var_165_64 .. ".cfg", buy_average_price[var_165_64])
			refresh_buy_top_list()

			if set.hello then
				sampAddChatMessage("• {00BB00}[" .. MAIN_TITLE .. "] {FFFFFF}Средние цены скупки обновлены!", 16777215)
			end

			if save_json(directory_buy_average_upload .. "\\" .. var_165_64 .. ".json", encodeJson(buy_average_to_send)) then
				upload_average("buy", var_165_64, directory_buy_average_upload .. "\\" .. var_165_64 .. ".json")
			elseif set.hello then
				sampAddChatMessage("• {FF8888}[" .. MAIN_TITLE .. "] {FFFFFF}Не удалось сохранить файл: " .. directory_buy_average_upload .. "\\" .. var_165_64 .. ".json", 16777215)
			end

			lua_thread.create(function()
				while pause do
					wait(0)
				end

				smart_wait(set.walk_delay, any_dialog_clock)
				sampSendDialogResponse(arg_165_0, 0, 0, "")
			end)
		elseif buy_average_parsing then
			local var_165_65 = 0

			for iter_165_16 in var_165_5:gmatch("[^\r\n]+") do
				local var_165_66 = iter_165_16:match("^[^\t]+")

				if not var_165_66:find("страница", 1, true) then
					average_index = average_index or var_165_65

					if var_165_65 == average_index then
						if (buy_average_parsing_all or buy_dplaylist[var_165_66]) and not average_dubl[var_165_66] then
							lua_thread.create(function()
								while pause do
									wait(0)
								end

								smart_wait(set.walk_delay, any_dialog_clock)

								average_dubl[var_165_66] = true

								sampSendDialogResponse(arg_165_0, 1, average_index, "")

								average_index = average_index + 1
							end)

							return
						else
							average_index = average_index + 1
						end
					end
				end

				var_165_65 = var_165_65 + 1
			end

			last_average_dialog_text = arg_165_5
			average_index = nil

			lua_thread.create(function()
				while pause do
					wait(0)
				end

				smart_wait(set.walk_delay, any_dialog_clock)
				sampSendDialogResponse(arg_165_0, 1, 1, "")
			end)
		end
	end

	local var_165_67 = var_165_1:match("Скупка товара '(.-)'", 1, true)

	if var_165_2:match("не найдено ни одной операции с этим товаром") then
		lua_thread.create(function()
			while pause do
				wait(0)
			end

			smart_wait(set.walk_delay, any_dialog_clock)
			sampSendDialogResponse(arg_165_0, 1, 0, "")
		end)
	elseif var_165_67 and buy_average_parsing then
		local var_165_68 = getArizonaName()

		buy_average_price[var_165_68] = buy_average_price[var_165_68] or {}
		buy_average_price[var_165_68][var_165_67] = {}

		for iter_165_17 in var_165_5:gmatch("[^\r\n]+") do
			local var_165_69, var_165_70, var_165_71 = iter_165_17:match("(.+)\t(.+)\t(.+)")
			local var_165_72 = var_165_71:gsub("[^%d]", "")
			local var_165_73 = tonumber(var_165_72)
			local var_165_74 = tonumber(var_165_70)

			table.insert(buy_average_price[var_165_68][var_165_67], {
				var_165_69,
				var_165_74,
				var_165_73
			})
		end

		buy_average_to_send[var_165_67] = buy_average_price[var_165_68][var_165_67]
		buy_average_price[var_165_68].update_time = buy_average_price[var_165_68].update_time or {}
		buy_average_price[var_165_68].update_time[var_165_67] = get_msc_time()

		lua_thread.create(function()
			while pause do
				wait(0)
			end

			smart_wait(set.walk_delay, any_dialog_clock)
			sampSendDialogResponse(arg_165_0, 1, 0, "")
		end)
	end
end

function sampev.onSendDialogResponse(arg_220_0, arg_220_1, arg_220_2, arg_220_3)
	restore_info_dialog = false

	local var_220_0 = sampGetDialogText():gsub("{%x%x%x%x%x%x}", "")

	if var_220_0:find("Управление продажей товаров", 1, true) or var_220_0:find("[1] Управление продажей товаров", 1, true) then
		if arg_220_1 == 1 then
			if arg_220_3 == "[6] Palatka.lua" or arg_220_3 == " " then
				img.window_menu.v = true
				uncollapse = true

				local var_220_1 = sampGetDialogText()
				local var_220_2 = sampGetDialogCaption()

				lua_thread.create(function()
					wait(0)
					sampShowDialog(arg_220_0, var_220_2, var_220_1, "Выбрать", "Отмена", DIALOG_STYLE_LIST)
					sampSetDialogClientside(false)
				end)

				return false
			end
		elseif arg_220_1 == 0 and arg_220_2 > 4 then
			return {
				arg_220_0,
				arg_220_1,
				0,
				arg_220_3
			}
		end
	end

	if var_220_0:find("Средние цены товаров при продаже", 1, true) then
		if arg_220_1 == 1 then
			if arg_220_3 == "Palatka.lua" or arg_220_3 == " " then
				img.window_menu.v = true
				uncollapse = true

				local var_220_3 = sampGetDialogText()
				local var_220_4 = sampGetDialogCaption()

				lua_thread.create(function()
					wait(0)
					sampShowDialog(arg_220_0, var_220_4, var_220_3, "Выбор", "Закрыть", DIALOG_STYLE_LIST)
					sampSetDialogClientside(false)
				end)

				return false
			end
		elseif arg_220_1 == 0 and arg_220_2 > 1 then
			return {
				arg_220_0,
				arg_220_1,
				0,
				arg_220_3
			}
		end
	end
end

function sampev.onShowTextDraw(arg_223_0, arg_223_1)
	if get_right_cell_pos(arg_223_1.position.x, arg_223_1.position.y) == #right_cell_list + 1 then
		table.insert(right_cell_list, arg_223_0)

		right_cell_selectable_dict[#right_cell_list] = arg_223_1.selectable == 1
	end

	if get_right_page_pos(arg_223_1.position.x, arg_223_1.position.y) == #right_page_list + 1 then
		table.insert(right_page_list, arg_223_0)
	end
end

function sampev.onSendClickTextDraw(arg_224_0)
	return
end

function sampev.onToggleSelectTextDraw(arg_225_0, arg_225_1)
	return
end

gogo = {}

local var_0_23
local var_0_24
local var_0_25

fa_font = nil

local var_0_26

function imgui.BeforeDrawFrame()
	if var_0_23 == nil then
		local var_226_0 = getFolderPath(20) .. "\\trebucbd.ttf"

		assert(doesFileExist(var_226_0), "WTF: Font \"" .. var_226_0 .. "\" doesn't exist")
		imgui.SwitchContext()

		local var_226_1 = imgui.ImFontAtlasGlyphRangesBuilder()

		var_226_1:AddRanges(imgui.GetIO().Fonts:GetGlyphRangesCyrillic())
		var_226_1:AddText(u8("‚„…†‡€‰‹‘’“”•–—™›№"))

		local var_226_2 = var_226_1:BuildRanges()

		var_0_23 = imgui.GetIO().Fonts:AddFontFromFileTTF(var_226_0, 30, nil, var_226_2)
	end

	if var_0_26 == nil then
		rebuild = false

		local var_226_3 = getFolderPath(20) .. "\\trebucbd.ttf"

		assert(doesFileExist(var_226_3), "WTF: Font \"" .. var_226_3 .. "\" doesn't exist")
		imgui.SwitchContext()

		local var_226_4 = imgui.ImFontAtlasGlyphRangesBuilder()

		var_226_4:AddRanges(imgui.GetIO().Fonts:GetGlyphRangesCyrillic())
		var_226_4:AddText(u8("‚„…†‡€‰‹‘’“”•–—™›№"))

		local var_226_5 = var_226_4:BuildRanges()

		var_0_26 = imgui.GetIO().Fonts:AddFontFromFileTTF(var_226_3, dialog_font_size, nil, var_226_5)
	end

	if var_0_24 == nil then
		local var_226_6 = getFolderPath(20) .. "\\trebucbd.ttf"

		assert(doesFileExist(var_226_6), "WTF: Font \"" .. var_226_6 .. "\" doesn't exist")
		imgui.SwitchContext()

		local var_226_7 = imgui.ImFontAtlasGlyphRangesBuilder()

		var_226_7:AddRanges(imgui.GetIO().Fonts:GetGlyphRangesCyrillic())
		var_226_7:AddText(u8("‚„…†‡€‰‹‘’“”•–—™›№"))

		local var_226_8 = var_226_7:BuildRanges()

		var_0_24 = imgui.GetIO().Fonts:AddFontFromFileTTF(var_226_6, math.floor(scale(14, set.scale)), nil, var_226_8)
	end

	if fa_font == nil then
		local var_226_9 = imgui.ImFontAtlasGlyphRangesBuilder()

		var_226_9:AddText(fa.ICON_FA_BARS)
		var_226_9:AddText(fa.ICON_FA_COMPRESS)
		var_226_9:AddText(fa.ICON_FA_EXPAND)
		var_226_9:AddText(fa.ICON_FA_TIMES)
		var_226_9:AddText(fa.ICON_FA_REPLY)
		var_226_9:AddText(fa.ICON_FA_LONG_ARROW_ALT_RIGHT)
		var_226_9:AddText(fa.ICON_FA_LONG_ARROW_ALT_LEFT)

		local var_226_10 = var_226_9:BuildRanges()
		local var_226_11 = imgui.ImFontConfig()

		var_226_11.MergeMode = true
		fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF("moonloader/resource/fonts/fa-solid-900.ttf", scale(14, set.scale), var_226_11, var_226_10)
	end
end

function dialog_average(arg_227_0, arg_227_1)
	local var_227_0 = {
		name = arg_227_0
	}
	local var_227_1 = imgui.GetStyle()

	if imgui.IsMouseClicked(1) then
		set.av_konverter = not set.av_konverter
		img.av_konverter.v = set.av_konverter

		ecfg.save(filename_set, set)
	end

	imgui.PushStyleColor(imgui.Col.Text, tmp.color_text)

	local var_227_2 = imgui.TextColoredRGB
	local var_227_3 = imgui.TextColoredRGB

	imgui.Text(u8(arg_227_0))

	local var_227_4 = buy_playlist.price_value == "VC$" and (set.av_konverter and "$ " or "VC$ ") or "$"
	local var_227_5 = sell_playlist.price_value == "VC$" and (set.av_konverter and "$ " or "VC$ ") or "$"
	local var_227_6 = buy_dplaylist[var_227_0.name] and var_227_4 .. " " .. sep((buy_playlist.price_value == "VC$" and set.av_konverter and img.av_kurs.buy.v or 1) * buy_dplaylist[var_227_0.name]) or var_227_4 .. " 0"
	local var_227_7 = sell_dplaylist[var_227_0.name] and var_227_5 .. " " .. sep((sell_playlist.price_value == "VC$" and set.av_konverter and img.av_kurs.sell.v or 1) * sell_dplaylist[var_227_0.name]) or var_227_5 .. " 0"
	local var_227_8 = sell_playlist.price_value == "$" and set.sell_komm or sell_playlist.price_value == "VC$" and set.sell_komm_vc
	local var_227_9 = sell_dplaylist[var_227_0.name] and math.floor(sell_dplaylist[var_227_0.name] * (1 - var_227_8 / 100)) or 0
	local var_227_10 = var_227_5 .. " " .. sep((sell_playlist.price_value == "VC$" and set.av_konverter and img.av_kurs.sell.v or 1) * var_227_9) or var_227_5 .. " 0"

	imgui.Separator()

	local var_227_11 = (imgui.GetWindowContentRegionWidth() - var_227_1.ItemSpacing.x) / 2

	imgui.PushStyleColor(imgui.Col.ChildWindowBg, imgui.ImVec4(0.1, 0.1, 0.1, 0))
	imgui.Columns(2, "first", false)

	if set.av_konverter then
		imgui.TextColoredRGB(u8("{6699AA}Покупка VC$ за ") .. img.av_kurs.buy.v .. u8(" $"))
		imgui.NextColumn()
		imgui.TextColoredRGB(u8("{6699AA}Продажа VC$ за ") .. img.av_kurs.sell.v .. " $")
		imgui.NewLine()
		imgui.NextColumn()
	else
		imgui.Columns(1, "first", false)
		imgui.TextDisabled(u8("Нажми правую кнопку мыши для конвертации VC$"))
		imgui.NewLine()
		imgui.Columns(2, "first", false)
	end

	imgui.SetColumnWidth(-1, scale(190, dialog_font_size / 14 * 100))
	var_227_2((buy_playlist.price_value == "VC$" and "{DD9966}" or "") .. var_227_6 .. u8(" cкупаю"))
	imgui.NextColumn()
	imgui.SetColumnWidth(-1, scale(190, dialog_font_size / 14 * 100))
	var_227_3((sell_playlist.price_value == "VC$" and "{DD9966}" or "") .. var_227_7 .. u8(" продаю"))
	imgui.NextColumn()
	imgui.SetColumnWidth(-1, scale(190, dialog_font_size / 14 * 100))
	imgui.NextColumn()
	imgui.SetColumnWidth(-1, scale(190, dialog_font_size / 14 * 100))

	if set.av_pricekom then
		var_227_3((sell_playlist.price_value == "VC$" and "{DD9966}" or "") .. var_227_10 .. u8(" (") .. 100 - var_227_8 .. "%)")
	end

	imgui.Separator()
	imgui.NextColumn()
	imgui.Columns(1, "first", false)
	imgui.BeginChild(arg_227_0, imgui.ImVec2(0, 0), false, (set.scroller or set.scroller_smooth) and imgui.WindowFlags.NoScrollWithMouse or 0)

	if set.scroller or set.scroller_smooth then
		imgui.Scroller("dialog_info_average", imgui.GetFrameHeight() * 3 + var_227_1.ItemSpacing.y, set.scroller_smooth and set.scroller_duration or 0)
	end

	local var_227_12 = buy_average_price[set.sa_name] and buy_average_price[set.sa_name][var_227_0.name] and buy_average_price[set.sa_name][var_227_0.name].list and buy_average_price[set.sa_name][var_227_0.name].update_time
	local var_227_13

	var_227_13 = var_227_12 and time_to_str(buy_average_price[set.sa_name][var_227_0.name].update_time)

	local var_227_14 = buy_average_price["Vice City"] and buy_average_price["Vice City"][var_227_0.name] and buy_average_price["Vice City"][var_227_0.name].list and buy_average_price["Vice City"][var_227_0.name].update_time
	local var_227_15

	var_227_15 = var_227_14 and time_to_str(buy_average_price["Vice City"][var_227_0.name].update_time)

	local var_227_16 = var_227_0.name:gsub("%(%+%d+%)", "")
	local var_227_17 = sell_average_price[set.sa_name] and sell_average_price[set.sa_name][var_227_16] and sell_average_price[set.sa_name][var_227_16].list and sell_average_price[set.sa_name][var_227_16].update_time
	local var_227_18

	var_227_18 = var_227_17 and time_to_str(sell_average_price[set.sa_name][var_227_16].update_time)

	local var_227_19 = sell_average_price["Vice City"] and sell_average_price["Vice City"][var_227_16] and sell_average_price["Vice City"][var_227_16].list and sell_average_price["Vice City"][var_227_16].update_time
	local var_227_20

	var_227_20 = var_227_19 and time_to_str(sell_average_price["Vice City"][var_227_16].update_time)

	imgui.Columns(2, "second", false)
	imgui.SetColumnWidth(-1, scale(170, dialog_font_size / 14 * 100))
	imgui.NextColumn()
	imgui.SetColumnWidth(-1, scale(170, dialog_font_size / 14 * 100))
	imgui.NextColumn()

	local var_227_21 = {}
	local var_227_22 = {}
	local var_227_23 = {}
	local var_227_24 = {}

	if var_227_12 then
		for iter_227_0, iter_227_1 in ipairs(buy_average_price[set.sa_name][var_227_0.name].list) do
			var_227_21[iter_227_1[1]] = {
				sa = iter_227_1
			}

			table.insert(var_227_23, iter_227_1[1])

			if iter_227_0 == 31 then
				break
			end
		end
	end

	if var_227_14 then
		for iter_227_2, iter_227_3 in ipairs(buy_average_price["Vice City"][var_227_0.name].list) do
			if not var_227_21[iter_227_3[1]] then
				var_227_21[iter_227_3[1]] = {}

				table.insert(var_227_23, iter_227_3[1])
			end

			var_227_21[iter_227_3[1]].vc = iter_227_3

			if iter_227_2 == 31 then
				break
			end
		end
	end

	if var_227_17 then
		for iter_227_4, iter_227_5 in ipairs(sell_average_price[set.sa_name][var_227_16].list) do
			var_227_22[iter_227_5[1]] = {
				sa = iter_227_5
			}

			table.insert(var_227_24, iter_227_5[1])

			if iter_227_4 == 31 then
				break
			end
		end
	end

	if var_227_19 then
		for iter_227_6, iter_227_7 in ipairs(sell_average_price["Vice City"][var_227_16].list) do
			if not var_227_22[iter_227_7[1]] then
				var_227_22[iter_227_7[1]] = {}

				table.insert(var_227_24, iter_227_7[1])
			end

			var_227_22[iter_227_7[1]].vc = iter_227_7

			if iter_227_6 == 31 then
				break
			end
		end
	end

	table.sort(var_227_23, function(arg_228_0, arg_228_1)
		if getArizonaName() == set.sa_name then
			if var_227_21[arg_228_0].sa and not var_227_21[arg_228_1].sa then
				return true
			elseif var_227_21[arg_228_0].sa and var_227_21[arg_228_1].sa then
				return str_to_time(arg_228_0) > str_to_time(arg_228_1)
			elseif not var_227_21[arg_228_0].sa and not var_227_21[arg_228_1].sa then
				return str_to_time(arg_228_0) > str_to_time(arg_228_1)
			end
		elseif var_227_21[arg_228_0].vc and not var_227_21[arg_228_1].vc then
			return true
		elseif var_227_21[arg_228_0].vc and var_227_21[arg_228_1].vc then
			return str_to_time(arg_228_0) > str_to_time(arg_228_1)
		elseif not var_227_21[arg_228_0].vc and not var_227_21[arg_228_1].vc then
			return str_to_time(arg_228_0) > str_to_time(arg_228_1)
		end
	end)
	table.sort(var_227_24, function(arg_229_0, arg_229_1)
		if getArizonaName() == set.sa_name then
			if var_227_22[arg_229_0].sa and not var_227_22[arg_229_1].sa then
				return true
			elseif var_227_22[arg_229_0].sa and var_227_22[arg_229_1].sa then
				return str_to_time(arg_229_0) > str_to_time(arg_229_1)
			elseif not var_227_22[arg_229_0].sa and not var_227_22[arg_229_1].sa then
				return str_to_time(arg_229_0) > str_to_time(arg_229_1)
			end
		elseif var_227_22[arg_229_0].vc and not var_227_22[arg_229_1].vc then
			return true
		elseif var_227_22[arg_229_0].vc and var_227_22[arg_229_1].vc then
			return str_to_time(arg_229_0) > str_to_time(arg_229_1)
		elseif not var_227_22[arg_229_0].vc and not var_227_22[arg_229_1].vc then
			return str_to_time(arg_229_0) > str_to_time(arg_229_1)
		end
	end)

	for iter_227_8 = 1, math.max(#var_227_23, #var_227_24) do
		local var_227_25 = var_227_21[var_227_23[iter_227_8]]
		local var_227_26 = var_227_22[var_227_24[iter_227_8]]

		if var_227_25 then
			imgui.TextDisabled(var_227_25 and var_227_25.sa and var_227_25.sa[1] or var_227_25 and var_227_25.vc and var_227_25.vc[1] or "Blyat")

			if var_227_25.sa then
				var_227_2("    " .. (set.left_price_value and "$ " or "") .. (var_227_25 and var_227_25.sa and sep(math.ceil(var_227_25.sa[3] / var_227_25.sa[2])) or "0") .. (not set.left_price_value and " $" or "") .. " (" .. (var_227_25 and var_227_25.sa and var_227_25.sa[2] or "0") .. u8(" шт)"))
			else
				var_227_2("    $")
			end

			if var_227_25.vc then
				var_227_2("{DD9966}    " .. (set.av_konverter and "$ " or "VC$ ") .. (var_227_25 and var_227_25.vc and sep(math.ceil(var_227_25.vc[3] * (set.av_konverter and img.av_kurs.buy.v or 1) / var_227_25.vc[2])) or "0") .. (not set.left_price_value and " VC$" or "") .. " (" .. (var_227_25 and var_227_25.vc and var_227_25.vc[2] or "0") .. u8(" шт)"))
			else
				var_227_2(u8("{DD9966}    ") .. (set.av_konverter and "$ " or "VC$ "))
			end
		else
			imgui.NewLine()
			imgui.NewLine()
			imgui.NewLine()
		end

		imgui.NextColumn()

		if var_227_26 then
			imgui.TextDisabled(var_227_26.sa and var_227_26.sa[1] or var_227_26.vc and var_227_26.vc[1] or "Blyat")

			if var_227_26.sa then
				var_227_3("    " .. (set.left_price_value and "$ " or "") .. (var_227_26.sa and sep(math.ceil(var_227_26.sa[3] / var_227_26.sa[2])) or "0") .. (not set.left_price_value and " $" or "") .. " (" .. (var_227_26.sa and var_227_26.sa[2] or "0") .. u8(" шт)"))
			else
				var_227_3("    $")
			end

			if var_227_26.vc then
				var_227_3("{DD9966}    " .. (set.av_konverter and "$ " or "VC$ ") .. (var_227_26.vc and sep(math.ceil(var_227_26.vc[3] * (set.av_konverter and img.av_kurs.sell.v or 1) / var_227_26.vc[2])) or "0") .. (not set.left_price_value and " VC$" or "") .. " (" .. (var_227_26.vc and var_227_26.vc[2] or "0") .. u8(" шт)"))
			else
				var_227_3(u8("{DD9966}    ") .. (set.av_konverter and "$ " or "VC$ "))
			end
		else
			imgui.NewLine()
			imgui.NewLine()
			imgui.NewLine()
		end

		imgui.Separator()
		imgui.NextColumn()
	end

	imgui.EndChild()
	imgui.PopStyleColor(2)
end

function imgui_average()
	local var_230_0 = imgui.GetStyle()

	imgui.PushStyleColor(imgui.Col.Text, tmp.color_text)
	imgui.PushStyleColor(imgui.Col.ChildWindowBg, imgui.ImVec4(0.1, 0.1, 0.1, 0))
	imgui.BeginChild("average", imgui.ImVec2(scale(400, set.scale), scale(448, set.scale)), false, imgui.WindowFlags.AlwaysUseWindowPadding)

	if imgui.IsMouseClicked(1) then
		set.av_konverter = not set.av_konverter
		img.av_konverter.v = set.av_konverter

		ecfg.save(filename_set, set)
	end

	local var_230_1 = tmp.popup_average.index
	local var_230_2 = tmp.popup_average.ImgItem
	local var_230_3 = tmp.popup_average.item
	local var_230_4 = imgui.TextColoredRGB
	local var_230_5 = imgui.TextColoredRGB

	imgui.Text(var_230_1 .. " - " .. var_230_2.name)

	local var_230_6 = buy_playlist.price_value == "VC$" and (set.av_konverter and "$ " or "VC$ ") or "$"
	local var_230_7 = sell_playlist.price_value == "VC$" and (set.av_konverter and "$ " or "VC$ ") or "$"
	local var_230_8 = buy_dplaylist[var_230_3.name] and var_230_6 .. " " .. sep((buy_playlist.price_value == "VC$" and set.av_konverter and img.av_kurs.buy.v or 1) * buy_dplaylist[var_230_3.name]) or var_230_6 .. " 0"
	local var_230_9 = sell_dplaylist[var_230_3.name] and var_230_7 .. " " .. sep((sell_playlist.price_value == "VC$" and set.av_konverter and img.av_kurs.sell.v or 1) * sell_dplaylist[var_230_3.name]) or var_230_7 .. " 0"
	local var_230_10 = sell_playlist.price_value == "$" and set.sell_komm or sell_playlist.price_value == "VC$" and set.sell_komm_vc
	local var_230_11 = sell_dplaylist[var_230_3.name] and math.floor(sell_dplaylist[var_230_3.name] * (1 - var_230_10 / 100)) or 0
	local var_230_12 = var_230_7 .. " " .. sep((sell_playlist.price_value == "VC$" and set.av_konverter and img.av_kurs.sell.v or 1) * var_230_11) or var_230_7 .. " 0"

	imgui.Separator()

	local var_230_13 = (imgui.GetWindowContentRegionWidth() - var_230_0.ItemSpacing.x) / 2
	local var_230_14 = {}
	local var_230_15 = {}
	local var_230_16 = {}

	imgui.Columns(2, "first", false)

	if set.av_konverter then
		imgui.TextColoredRGB(u8("{6699AA}Покупка VC$ за ") .. img.av_kurs.buy.v .. u8(" $"))
		imgui.NextColumn()
		imgui.TextColoredRGB(u8("{6699AA}Продажа VC$ за ") .. img.av_kurs.sell.v .. " $")
		imgui.NewLine()
		imgui.NextColumn()
	else
		imgui.Columns(1, "first", false)
		imgui.TextDisabled(u8("Нажми правую кнопку мыши для конвертации VC$"))
		imgui.NewLine()
		imgui.Columns(2, "first", false)
	end

	imgui.SetColumnWidth(-1, scale(170, set.scale))
	var_230_4((buy_playlist.price_value == "VC$" and "{DD9966}" or "") .. var_230_8 .. u8(" cкупаю"))
	imgui.NextColumn()
	imgui.SetColumnWidth(-1, scale(170, set.scale))
	var_230_5((sell_playlist.price_value == "VC$" and "{DD9966}" or "") .. var_230_9 .. u8(" продаю"))
	imgui.NextColumn()
	imgui.SetColumnWidth(-1, scale(170, set.scale))
	imgui.NextColumn()
	imgui.SetColumnWidth(-1, scale(170, set.scale))

	if set.av_pricekom then
		var_230_5((sell_playlist.price_value == "VC$" and "{DD9966}" or "") .. var_230_12 .. u8(" (") .. 100 - var_230_10 .. "%)")
	end

	imgui.Separator()
	imgui.NextColumn()
	imgui.Columns(1, "first", false)
	imgui.BeginChild(var_230_1 .. " - " .. var_230_2.name, imgui.ImVec2(0, 0), false, (set.scroller or set.scroller_smooth or imgui.IsMouseDown(0)) and imgui.WindowFlags.NoScrollWithMouse or 0)

	if set.scroller or set.scroller_smooth or imgui.IsMouseDown(0) then
		imgui.Scroller("average details", imgui.GetFrameHeight() * 3 + var_230_0.ItemSpacing.y, set.scroller_smooth and set.scroller_duration or 0, 0, true)
	end

	local var_230_17 = buy_average_price[set.sa_name] and buy_average_price[set.sa_name][var_230_3.name] and buy_average_price[set.sa_name][var_230_3.name].list and buy_average_price[set.sa_name][var_230_3.name].update_time
	local var_230_18

	var_230_18 = var_230_17 and time_to_str(buy_average_price[set.sa_name][var_230_3.name].update_time)

	local var_230_19 = buy_average_price["Vice City"] and buy_average_price["Vice City"][var_230_3.name] and buy_average_price["Vice City"][var_230_3.name].list and buy_average_price["Vice City"][var_230_3.name].update_time
	local var_230_20

	var_230_20 = var_230_19 and time_to_str(buy_average_price["Vice City"][var_230_3.name].update_time)

	local var_230_21 = var_230_3.name:gsub("%(%+%d+%)", "")
	local var_230_22 = sell_average_price[set.sa_name] and sell_average_price[set.sa_name][var_230_21] and sell_average_price[set.sa_name][var_230_21].list and sell_average_price[set.sa_name][var_230_21].update_time
	local var_230_23

	var_230_23 = var_230_22 and time_to_str(sell_average_price[set.sa_name][var_230_21].update_time)

	local var_230_24 = sell_average_price["Vice City"] and sell_average_price["Vice City"][var_230_21] and sell_average_price["Vice City"][var_230_21].list and sell_average_price["Vice City"][var_230_21].update_time
	local var_230_25

	var_230_25 = var_230_24 and time_to_str(sell_average_price["Vice City"][var_230_21].update_time)

	local var_230_26 = {}
	local var_230_27 = {}
	local var_230_28 = {}
	local var_230_29 = {}

	imgui.Columns(2, "second", false)

	local var_230_30 = 170

	imgui.SetColumnWidth(-1, scale(var_230_30, set.scale))
	imgui.NextColumn()
	imgui.SetColumnWidth(-1, scale(var_230_30, set.scale))
	imgui.NextColumn()

	if var_230_17 then
		for iter_230_0, iter_230_1 in ipairs(buy_average_price[set.sa_name][var_230_3.name].list) do
			var_230_26[iter_230_1[1]] = {
				sa = iter_230_1
			}

			table.insert(var_230_28, iter_230_1[1])

			if iter_230_0 == 31 then
				break
			end
		end
	end

	if var_230_19 then
		for iter_230_2, iter_230_3 in ipairs(buy_average_price["Vice City"][var_230_3.name].list) do
			if not var_230_26[iter_230_3[1]] then
				var_230_26[iter_230_3[1]] = {}

				table.insert(var_230_28, iter_230_3[1])
			end

			var_230_26[iter_230_3[1]].vc = iter_230_3

			if iter_230_2 == 31 then
				break
			end
		end
	end

	if var_230_22 then
		for iter_230_4, iter_230_5 in ipairs(sell_average_price[set.sa_name][var_230_21].list) do
			var_230_27[iter_230_5[1]] = {
				sa = iter_230_5
			}

			table.insert(var_230_29, iter_230_5[1])

			if iter_230_4 == 31 then
				break
			end
		end
	end

	if var_230_24 then
		for iter_230_6, iter_230_7 in ipairs(sell_average_price["Vice City"][var_230_21].list) do
			if not var_230_27[iter_230_7[1]] then
				var_230_27[iter_230_7[1]] = {}

				table.insert(var_230_29, iter_230_7[1])
			end

			var_230_27[iter_230_7[1]].vc = iter_230_7

			if iter_230_6 == 31 then
				break
			end
		end
	end

	table.sort(var_230_28, function(arg_231_0, arg_231_1)
		if getArizonaName() == set.sa_name then
			if var_230_26[arg_231_0].sa and not var_230_26[arg_231_1].sa then
				return true
			elseif var_230_26[arg_231_0].sa and var_230_26[arg_231_1].sa then
				return str_to_time(arg_231_0) > str_to_time(arg_231_1)
			elseif not var_230_26[arg_231_0].sa and not var_230_26[arg_231_1].sa then
				return str_to_time(arg_231_0) > str_to_time(arg_231_1)
			end
		elseif var_230_26[arg_231_0].vc and not var_230_26[arg_231_1].vc then
			return true
		elseif var_230_26[arg_231_0].vc and var_230_26[arg_231_1].vc then
			return str_to_time(arg_231_0) > str_to_time(arg_231_1)
		elseif not var_230_26[arg_231_0].vc and not var_230_26[arg_231_1].vc then
			return str_to_time(arg_231_0) > str_to_time(arg_231_1)
		end
	end)
	table.sort(var_230_29, function(arg_232_0, arg_232_1)
		if getArizonaName() == set.sa_name then
			if var_230_27[arg_232_0].sa and not var_230_27[arg_232_1].sa then
				return true
			elseif var_230_27[arg_232_0].sa and var_230_27[arg_232_1].sa then
				return str_to_time(arg_232_0) > str_to_time(arg_232_1)
			elseif not var_230_27[arg_232_0].sa and not var_230_27[arg_232_1].sa then
				return str_to_time(arg_232_0) > str_to_time(arg_232_1)
			end
		elseif var_230_27[arg_232_0].vc and not var_230_27[arg_232_1].vc then
			return true
		elseif var_230_27[arg_232_0].vc and var_230_27[arg_232_1].vc then
			return str_to_time(arg_232_0) > str_to_time(arg_232_1)
		elseif not var_230_27[arg_232_0].vc and not var_230_27[arg_232_1].vc then
			return str_to_time(arg_232_0) > str_to_time(arg_232_1)
		end
	end)

	for iter_230_8 = 1, math.max(#var_230_28, #var_230_29) do
		local var_230_31 = var_230_26[var_230_28[iter_230_8]]
		local var_230_32 = var_230_27[var_230_29[iter_230_8]]

		if var_230_31 then
			imgui.TextDisabled(var_230_31 and var_230_31.sa and var_230_31.sa[1] or var_230_31 and var_230_31.vc and var_230_31.vc[1] or "Blyat")

			if var_230_31.sa then
				var_230_4("    " .. "$ " .. (var_230_31 and var_230_31.sa and sep(math.ceil(var_230_31.sa[3] / var_230_31.sa[2])) or "0") .. (not set.left_price_value and " $" or "") .. " (" .. (var_230_31 and var_230_31.sa and var_230_31.sa[2] or "0") .. u8(" шт)"))
			else
				var_230_4(u8("    $"))
			end

			if var_230_31.vc then
				var_230_4("{DD9966}    " .. (set.av_konverter and "$ " or "VC$ ") .. (var_230_31 and var_230_31.vc and sep(math.ceil(var_230_31.vc[3] * (set.av_konverter and img.av_kurs.buy.v or 1) / var_230_31.vc[2])) or "0") .. (not set.left_price_value and " VC$" or "") .. " (" .. (var_230_31 and var_230_31.vc and var_230_31.vc[2] or "0") .. u8(" шт)"))
			else
				var_230_4(u8("{DD9966}    ") .. (set.av_konverter and "$ " or "VC$ "))
			end
		else
			imgui.NewLine()
			imgui.NewLine()
			imgui.NewLine()
		end

		imgui.NextColumn()

		if var_230_32 then
			imgui.TextDisabled(var_230_32.sa and var_230_32.sa[1] or var_230_32.vc and var_230_32.vc[1] or "Blyat")

			if var_230_32.sa then
				var_230_5("    " .. "$ " .. (var_230_32.sa and sep(math.ceil(var_230_32.sa[3] / var_230_32.sa[2])) or "0") .. (not set.left_price_value and " $" or "") .. " (" .. (var_230_32.sa and var_230_32.sa[2] or "0") .. u8(" шт)"))
			else
				var_230_5(u8("    $"))
			end

			if var_230_32.vc then
				var_230_5("{DD9966}    " .. (set.av_konverter and "$ " or "VC$ ") .. (var_230_32.vc and sep(math.ceil(var_230_32.vc[3] * (set.av_konverter and img.av_kurs.sell.v or 1) / var_230_32.vc[2])) or "0") .. (not set.left_price_value and " VC$" or "") .. " (" .. (var_230_32.vc and var_230_32.vc[2] or "0") .. u8(" шт)"))
			else
				var_230_5(u8("{DD9966}    ") .. (set.av_konverter and "$ " or "VC$ "))
			end
		else
			imgui.NewLine()
			imgui.NewLine()
			imgui.NewLine()
		end

		imgui.Separator()
		imgui.NextColumn()
	end

	imgui.EndChild()
	imgui.EndChild()
	imgui.PopStyleColor(2)
end

function imgui.OnDrawFrame()

	imgui.PushFont(var_0_24)

	local var_233_0 = imgui.GetStyle()
	local var_233_1, var_233_2 = getScreenResolutionEx()

	if not imgui.IsMouseDown(0) then
		imgui.TNotif.draw()
	end

	if img.window_info_dialg.v and info_dialog and not sampIsChatInputActive() and not isSampfuncsConsoleActive() and not sampIsScoreboardOpen() then
		--if false then
		imgui.PushFont(var_0_26)
		imgui.PushStyleColor(imgui.Col.WindowBg, imgui.ImVec4(0.06, 0.06, 0.06, 0.98))
		imgui.PushStyleColor(imgui.Col.ChildWindowBg, imgui.ImVec4(0.1, 0.1, 0.1, 0))
		imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.12, 0.12, 0.12, 1))
		imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(0.15, 0.15, 0.15, 1))
		imgui.PushStyleColor(imgui.Col.ButtonActive, var_233_0.Colors[imgui.Col.ButtonHovered])
		imgui.PushStyleColor(imgui.Col.FrameBg, var_233_0.Colors[imgui.Col.Button])
		imgui.PushStyleColor(imgui.Col.ScrollbarBg, imgui.ImVec4(0.04, 0.04, 0.04, 1))
		imgui.PushStyleColor(imgui.Col.ScrollbarGrab, var_233_0.Colors[imgui.Col.Button])
		imgui.PushStyleColor(imgui.Col.ScrollbarGrabHovered, var_233_0.Colors[imgui.Col.ButtonHovered])
		imgui.PushStyleColor(imgui.Col.ScrollbarGrabActive, var_233_0.Colors[imgui.Col.ButtonActive])
		imgui.PushStyleVar(imgui.StyleVar.FramePadding, DefaultStyle.FramePadding)
		imgui.PushStyleVar(imgui.StyleVar.ItemSpacing, DefaultStyle.ItemSpacing)

		local var_233_3 = var_233_0.ScrollbarSize

		var_233_0.ScrollbarSize = DefaultStyle.ScrollbarSize

		imgui.PushStyleVar(imgui.StyleVar.GrabMinSize, DefaultStyle.GrabMinSize)

		info_dialog.ctitle = "Palatka.lua | t.me/DoubleTapInside"
		info_dialog.title = "{BFBBBA}Palatka.lua | t.me/DoubleTapInside"

		local var_233_4 = imgui.CalcTextSize(u8(info_dialog.ctext))
		local var_233_5 = imgui.CalcTextSize(u8(info_dialog.ctitle))
		local var_233_6 = DIALOG_STYLE_INPUT == info_dialog.style and var_233_0.ItemSpacing.y + imgui.GetFrameHeight() or 0
		local var_233_7 = DIALOG_STYLE_INPUT == info_dialog.style and var_233_0.ItemSpacing.y or 0
		local var_233_8 = imgui.GetFrameHeight() * 2
		local var_233_9 = scale(100, dialog_font_size / 14 * 100)
		local var_233_10 = scale(340, dialog_font_size / 14 * 100) + var_233_0.ScrollbarSize
		local var_233_11 = var_233_4.y
		local var_233_12 = math.max(var_233_4.x, var_233_5.x) + var_233_0.WindowPadding.x * 4 + var_233_0.ScrollbarSize
		local var_233_13 = imgui.GetFrameHeight()
		local var_233_14 = var_233_12 + var_233_10
		local var_233_15 = var_233_0.WindowPadding.y + var_233_0.WindowPadding.y + var_233_13 + var_233_0.ItemSpacing.y * 2 + var_233_11 + var_233_7 + var_233_6 + var_233_0.ItemSpacing.y + var_233_8 + var_233_0.WindowPadding.y + var_233_0.WindowPadding.y
		local var_233_16 = math.max(imgui.GetFrameHeight() * 17 + var_233_0.ItemSpacing.y * 5, var_233_15)
		local var_233_17 = math.min(var_233_1, var_233_14)
		local var_233_18 = math.min(var_233_2, var_233_16)

		imgui.SetNextWindowSize(imgui.ImVec2(var_233_17, var_233_18), imgui.Cond.Always)
		imgui.SetNextWindowPos(imgui.ImVec2(var_233_1 / 2 - var_233_17 / 2, var_233_2 / 2 - var_233_18 / 2), imgui.Cond.Always)
		imgui.Begin("##img.window_info_dialg", nil, imgui.WindowFlags.NoScrollWithMouse + imgui.WindowFlags.NoScrollbar + imgui.WindowFlags.NoTitleBar + imgui.WindowFlags.NoResize)
		imgui.BeginChild("all left", imgui.ImVec2(-var_233_10, 0), false, imgui.WindowFlags.NoScrollWithMouse + imgui.WindowFlags.NoScrollbar + imgui.WindowFlags.AlwaysUseWindowPadding)
		imgui.TextColoredRGB(u8(info_dialog.title))
		imgui.Separator()
		imgui.BeginChild("info_dialog.text", imgui.ImVec2(0, -(var_233_6 + var_233_0.ItemSpacing.y + var_233_8)), false, (set.scroller or set.scroller_smooth) and imgui.WindowFlags.NoScrollWithMouse or 0)

		if set.scroller or set.scroller_smooth then
			imgui.Scroller("dialog_info_text", imgui.GetFrameHeight() * 3, set.scroller_smooth and set.scroller_duration or 0)
		end

		imgui.PushStyleVar(imgui.StyleVar.ItemSpacing, imgui.ImVec2(0, 0))
		imgui.TextColoredRGB(u8(info_dialog.text))
		imgui.PopStyleVar()
		imgui.EndChild()

		if DIALOG_STYLE_INPUT == info_dialog.style then
			imgui.PushItemWidth(-0.4)
			imgui.InputText("##img.info_dialog_buffer", img.info_dialog_buffer, imgui.InputTextFlags.AutoSelectAll)
			imgui.PopItemWidth()

			if focus_info_dialog then
				imgui.SetKeyboardFocusHere()

				focus_info_dialog = false
			end
		end

		local var_233_19 = info_dialog.button1 ~= "" and info_dialog.button0 ~= "" and 2 or 1
		local var_233_20 = var_233_19 * var_233_9 + var_233_0.ItemInnerSpacing.x * (var_233_19 - 1)
		local var_233_21 = imgui.GetWindowContentRegionWidth() / 2 - var_233_20 / 2

		imgui.NewLine()
		imgui.SameLine(var_233_21)

		if info_dialog.button1 ~= "" and imgui.Button(u8(info_dialog.button1), imgui.ImVec2(var_233_9, var_233_8)) then
			sampSetDialogClientside(true)
			sampCloseCurrentDialogWithButton(1)

			img.window_info_dialg.v = false

			local var_233_22

			if DIALOG_STYLE_INPUT == info_dialog.style then
				var_233_22 = u8:decode(img.info_dialog_buffer.v)
			end

			sampSendDialogResponse(info_dialog.id, 1, -1, var_233_22)
			sampev.onSendDialogResponse(info_dialog.id, 1, -1, var_233_22)
		end

		if info_dialog.button0 ~= "" then
			imgui.SameLine()

			if imgui.Button(u8(info_dialog.button0), imgui.ImVec2(var_233_9, var_233_8)) then
				sampSetDialogClientside(true)
				sampCloseCurrentDialogWithButton(0)

				img.window_info_dialg.v = false

				local var_233_23

				if DIALOG_STYLE_INPUT == info_dialog.style then
					var_233_23 = u8:decode(img.info_dialog_buffer.v)
				end

				sampSendDialogResponse(info_dialog.id, 0, -1, var_233_23)
				sampev.onSendDialogResponse(info_dialog.id, 0, -1, var_233_23)
			end
		end

		imgui.EndChild()
		imgui.SameLine()
		imgui.BeginChild("average", imgui.ImVec2(0, 0), true, imgui.WindowFlags.AlwaysUseWindowPadding + imgui.WindowFlags.NoScrollWithMouse + imgui.WindowFlags.NoScrollbar)

		local var_233_24 = "ЁёАаБбВвГгДдЕеЖжЗзИиЙйКкЛлМмНнОоПпРрСсТтУуФфХхЦцЧчШшЩщЪъЫыЬьЭэЮюЯя"
		local var_233_25 = #info_dialog.ctext:match("(.-)\n") > 0 and info_dialog.ctext:match("(.-)\n") or info_dialog.ctext:match("\n(.-)\n")
		local var_233_26, var_233_27 = var_233_25:match("^([" .. var_233_24 .. "%s]+: )(.+)$")

		if var_233_26 and var_233_27 then
			if var_233_26 == "Скин: " then
				var_233_27 = var_233_26 .. var_233_27
			end
		else
			var_233_27 = var_233_25:match("(.+)")
		end

		if var_233_27 then
			var_233_27 = var_233_27:gsub(" %(модификация%)$", "")
			var_233_27 = var_233_27:gsub(" %(объект%)$", "")
			var_233_27 = var_233_27:gsub(" %(%d%-й уровень нашивки%)$", "")
			var_233_27 = var_233_27:gsub("%(%Улучшение%)$", "")
			var_233_27 = var_233_27:gsub("При открытии этого ларца вы получите случайный ларец с содержимым%.$", "Ларец испытателя %(Mobile 2%.1%)")
			var_233_27 = var_233_27:gsub("Micro Uzi %(Mac 10%)", "Micro SMG/UZI")
		end

		dialog_average(var_233_27 or "< Ошибка >", "all")
		imgui.EndChild()
		imgui.End()
		imgui.PopFont()
		imgui.PopStyleVar(3)
		imgui.PopStyleColor(10)

		var_233_0.ScrollbarSize = var_233_3
	end

	local var_233_28 = not sampIsDialogActive() and not sampIsChatInputActive() and sampIsCursorActive()
	--if false then
	if set.allow_remote and not set.remote and (not isCursorVisible() or sampGetCursorMode() ~= 0) and not var_233_28 and not EXPORTS.is_working() then
		local var_233_29 = var_233_1 / 2
		local var_233_30 = (var_233_2 - var_233_2 / 1.25) / 2
		local var_233_31 = 11
		local var_233_32 = 1
		local var_233_33 = (var_233_1 - var_233_0.ItemSpacing.x * (var_233_31 - 1)) / var_233_31
		local var_233_34 = (imgui.GetWindowContentRegionMax().y - imgui.GetWindowContentRegionMin().y - var_233_0.ItemSpacing.y * (var_233_32 - 1)) / var_233_32
		local var_233_35 = imgui.ImVec2(var_233_33, var_233_30)

		imgui.PushStyleColor(imgui.Col.WindowBg, imgui.ImVec4(0.1, 0.1, 0.1, 0))
		imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.2, 0.2, 0.2, 0.25))
		imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(1, 1, 1, 0.5))
		imgui.PushStyleColor(imgui.Col.ButtonHovered, var_233_0.Colors[imgui.Col.Button])
		imgui.PushStyleColor(imgui.Col.ButtonActive, var_233_0.Colors[imgui.Col.Button])
		imgui.PushStyleVar(imgui.StyleVar.FrameRounding, 15)
		imgui.PushStyleVar(imgui.StyleVar.WindowPadding, imgui.ImVec2(0, 0))
		imgui.PushFont(var_0_23)
		imgui.SetNextWindowSize(var_233_35, imgui.Cond.Always)
		imgui.SetNextWindowPos(imgui.ImVec2(var_233_1 - var_233_33 - 10, var_233_2 / 3.5 - var_233_30 / 2), imgui.Cond.Always)
		imgui.Begin("window_activate_rc", nil, imgui.WindowFlags.NoScrollWithMouse + imgui.WindowFlags.NoScrollbar + imgui.WindowFlags.NoTitleBar + imgui.WindowFlags.NoResize)

		if imgui.Button(u8("Т"), imgui.ImVec2(-0.4, -0.4)) then
			-- block empty
		end

		if imgui.IsItemActive() then
			set.remote = true

			ecfg.save(filename_set, set)
		end

		imgui.End()
		imgui.PopStyleColor(5)
		imgui.PopStyleVar(2)
		imgui.PopFont()
	end
	--if false then
	if set.allow_remote and set.remote and not img.window_menu.v and not img.window_info_dialg.v then
		local var_233_36, var_233_37 = getCursorPos()
		local var_233_38 = var_233_1 / 2
		local var_233_39 = var_233_2 / 1.25
		local var_233_40 = math.min(var_233_38, var_233_39)
		local var_233_41 = math.min(var_233_38, var_233_39)
		local var_233_42 = CONTROLLABLE and not sampIsScoreboardOpen() and not sampIsChatInputActive() and not sampIsDialogActive() and not isSampfuncsConsoleActive() and not EXPORTS.is_working() and not sampIsCursorActive()

		if isCharOnFoot(PLAYER_PED) and var_233_42 then
			local var_233_43 = var_233_1 - var_233_38
			local var_233_44 = var_233_2 - var_233_39
			local var_233_45 = var_233_1 - var_233_40
			local var_233_46 = var_233_2 - var_233_39 + (var_233_39 / 2 - var_233_41 / 2)
			local var_233_47 = math.min(var_233_40 / 3, var_233_41 / 3)
			local var_233_48 = math.min(var_233_40 / 3, var_233_41 / 3)
			local var_233_49 = var_233_46 + var_233_48 * 1.25
			local var_233_50 = var_233_46 + var_233_41 - var_233_48 * 1.25

			if not rc_onfoot then
				rc_onfoot = {}
				rc_onfoot.btn_x = var_233_43 + var_233_38 / 2 - var_233_47 / 2
				rc_onfoot.btn_y = var_233_46 + var_233_41 / 2 - var_233_48 / 2
				rc_onfoot.locked = false
				rc_onfoot.active = true
			end

			if rc_onfoot.locked then
				rc_onfoot.btn_x, rc_onfoot.btn_y = var_233_36 - var_233_47 / 2, var_233_37 - var_233_48 / 2

				lua_thread.create(function()
					wait(0)
					setGameKeyState(game_keys.player.GOFORWARD_GOBACK, -256)

					if var_233_37 < var_233_50 and var_233_37 > var_233_49 then
						setGameKeyState(game_keys.player.JUMP, 256)
					elseif var_233_37 <= var_233_49 then
						setGameKeyState(game_keys.player.SPRINT, 256)
					end
				end)
			end

			renderDrawLine(rc_onfoot.btn_x - var_233_47 / 3, var_233_49, rc_onfoot.btn_x + var_233_47 + var_233_47 / 3, var_233_49, 2, 2013265919)
			renderDrawLine(rc_onfoot.btn_x - var_233_47 / 3, var_233_49 + 2, rc_onfoot.btn_x + var_233_47 + var_233_47 / 3, var_233_49 + 2, 2, 1999844147)
			renderDrawLine(rc_onfoot.btn_x - var_233_47 / 3, var_233_50, rc_onfoot.btn_x + var_233_47 + var_233_47 / 3, var_233_50, 2, 2013265919)
			renderDrawLine(rc_onfoot.btn_x - var_233_47 / 3, var_233_50 + 2, rc_onfoot.btn_x + var_233_47 + var_233_47 / 3, var_233_50 + 2, 2, 1999844147)

			if rc_onfoot.locked then
				renderFigure2D(rc_onfoot.btn_x + var_233_47 / 2, rc_onfoot.btn_y + var_233_48 / 2, var_233_47 / 5, var_233_47 / 2, 3, 2013265919)
				renderFigure2D(rc_onfoot.btn_x + var_233_47 / 2, rc_onfoot.btn_y + var_233_48 / 2, var_233_47 / 5 + 2, var_233_47 / 2 + 2, 2, 1999844147)
			end

			if old_cx and old_cy and isCursorInArea2D(0, var_233_44 / 2, var_233_1, var_233_44 + var_233_39) then
				shiftCameraByPixelsOffset(-(old_cx - var_233_36) * set.remote_camera_speed, not rc_onfoot.locked and -(old_cy - var_233_37) or 0)
			end

			old_cx, old_cy = var_233_36, var_233_37

			if imgui.IsMouseDown(0) then
				if isCursorInArea2D(var_233_43, var_233_44, var_233_43 + var_233_38, var_233_44 + var_233_39) then
					if rc_onfoot.active then
						rc_onfoot.locked = true
					end
				else
					rc_onfoot.active = false
				end
			else
				if rc_onfoot.locked then
					rc_onfoot.btn_x = var_233_43 + var_233_38 / 2 - var_233_47 / 2
					rc_onfoot.btn_y = var_233_46 + var_233_41 / 2 - var_233_48 / 2
				end

				rc_onfoot = nil
				old_cx, old_cy = nil
			end
		end

		if not isCharOnFoot(PLAYER_PED) and var_233_42 then
			local var_233_51 = var_233_1 - var_233_38
			local var_233_52 = var_233_2 - var_233_39
			local var_233_53 = math.min(var_233_38, var_233_39)
			local var_233_54 = math.min(var_233_38, var_233_39)
			local var_233_55 = var_233_1 - var_233_53
			local var_233_56 = var_233_2 - var_233_39 + (var_233_39 / 2 - var_233_54 / 2)
			local var_233_57 = math.min(var_233_53 / 3, var_233_54 / 3)
			local var_233_58 = math.min(var_233_53 / 3, var_233_54 / 3)

			btn_x = var_233_55 + var_233_53 / 2 - var_233_57 / 2
			btn_y = var_233_56 + var_233_54 / 2 - var_233_58 / 2

			if not rc_onvehicle then
				rc_onvehicle = {}
				rc_onvehicle.btn_x = var_233_55 + var_233_53 / 2 - var_233_57 / 2
				rc_onvehicle.btn_y = var_233_56 + var_233_54 / 2 - var_233_58 / 2
				rc_onvehicle.locked = false
				rc_onvehicle.active = true
			end

			local var_233_59 = btn_x + var_233_57 / 2
			local var_233_60 = btn_y + var_233_58 / 2
			local var_233_61 = var_233_56 + var_233_58 / 1.5
			local var_233_62 = var_233_56 + var_233_54 - var_233_58 / 1.5
			local var_233_63 = var_233_55 + var_233_57 / 4
			local var_233_64 = var_233_55 + var_233_53 - var_233_57 / 4

			if rc_onvehicle.locked then
				rc_onvehicle.btn_x, rc_onvehicle.btn_y = var_233_36 - var_233_57 / 2, var_233_37 - var_233_58 / 2

				local var_233_65 = var_233_60 - var_233_61
				local var_233_66 = var_233_37 - var_233_61
				local var_233_67 = 1 - math.max(0, var_233_66 / var_233_65)

				if var_233_66 < var_233_65 then
					lua_thread.create(function()
						wait(0)
						setGameKeyState(game_keys.vehicle.ACCELERATE, 256 * var_233_67)
					end)
				end

				local var_233_68 = var_233_62 - var_233_60
				local var_233_69 = var_233_62 - var_233_37
				local var_233_70 = 1 - math.max(0, var_233_69 / var_233_68)

				if var_233_69 < var_233_68 then
					lua_thread.create(function()
						wait(0)
						setGameKeyState(game_keys.vehicle.ACCELERATE, -128 * var_233_70)
					end)
				end

				local var_233_71 = var_233_59 - var_233_63
				local var_233_72 = var_233_36 - var_233_63
				local var_233_73 = 1 - math.max(0, var_233_72 / var_233_71)

				if var_233_72 < var_233_71 then
					lua_thread.create(function()
						wait(0)
						setGameKeyState(game_keys.vehicle.GOLEFT_GORIGHT, -128 * var_233_73)
					end)
				end

				local var_233_74 = var_233_64 - var_233_59
				local var_233_75 = var_233_64 - var_233_36
				local var_233_76 = 1 - math.max(0, var_233_75 / var_233_74)

				if var_233_75 < var_233_74 then
					lua_thread.create(function()
						wait(0)
						setGameKeyState(game_keys.vehicle.GOLEFT_GORIGHT, 128 * var_233_76)
					end)
				end
			end

			renderFigure2D(rc_onvehicle.btn_x + var_233_57 / 2, rc_onvehicle.btn_y + var_233_58 / 2, var_233_57 / 5, var_233_57 / 2, 3, 2013265919)
			renderFigure2D(rc_onvehicle.btn_x + var_233_57 / 2, rc_onvehicle.btn_y + var_233_58 / 2, var_233_57 / 5 + 2, var_233_57 / 2 + 2, 2, 1999844147)

			local var_233_77 = var_233_58 / 4

			renderDrawLine(var_233_63, var_233_61 + var_233_77, var_233_63, var_233_62 - var_233_77, 2, 2013265919)
			renderDrawLine(var_233_63 - 2, var_233_61 + var_233_77, var_233_63 - 2, var_233_62 - var_233_77, 2, 1999844147)
			renderDrawLine(var_233_63 + var_233_77, var_233_62, var_233_64 - var_233_77, var_233_62, 2, 2013265919)
			renderDrawLine(var_233_63 + var_233_77, var_233_62 + 2, var_233_64 - var_233_77, var_233_62 + 2, 2, 1999844147)
			renderDrawLine(var_233_64, var_233_62 - var_233_77, var_233_64, var_233_61 + var_233_77, 2, 2013265919)
			renderDrawLine(var_233_64 + 2, var_233_62 - var_233_77, var_233_64 + 2, var_233_61 + var_233_77, 2, 1999844147)
			renderDrawLine(var_233_64 - var_233_77, var_233_61, var_233_63 + var_233_77, var_233_61, 2, 2013265919)
			renderDrawLine(var_233_64 - var_233_77, var_233_61 - 2, var_233_63 + var_233_77, var_233_61 - 2, 2, 1999844147)

			old_cx, old_cy = var_233_36, var_233_37

			if imgui.IsMouseDown(0) then
				if isCursorInArea2D(var_233_55, var_233_56, var_233_55 + var_233_53, var_233_56 + var_233_54) then
					if rc_onvehicle.active then
						rc_onvehicle.locked = true
					end
				else
					rc_onvehicle.active = false
				end
			else
				if rc_onvehicle.locked then
					rc_onvehicle.btn_x = var_233_55 + var_233_53 / 2 - var_233_57 / 2
					rc_onvehicle.btn_y = var_233_56 + var_233_54 / 2 - var_233_58 / 2
				end

				rc_onvehicle = nil
				old_cx, old_cy = nil
			end
		end

		local var_233_78 = var_233_1
		local var_233_79 = (var_233_2 - var_233_39) / 2
		local var_233_80 = var_233_1 - var_233_1
		local var_233_81 = var_233_2 - var_233_2

		imgui.PushStyleColor(imgui.Col.WindowBg, imgui.ImVec4(0.1, 0.1, 0.1, 0.85))
		imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.2, 0.2, 0.2, 0))
		imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(0.2, 0.2, 0.2, 0))
		imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(0.3, 0.3, 0.3, 1))
		imgui.PushStyleVar(imgui.StyleVar.WindowRounding, 0)
		imgui.PushStyleVar(imgui.StyleVar.ItemSpacing, imgui.ImVec2(0, 0))
		imgui.PushStyleVar(imgui.StyleVar.WindowPadding, imgui.ImVec2(0, 0))
		imgui.PushFont(var_0_23)
		imgui.SetNextWindowSize(imgui.ImVec2(var_233_78, var_233_79), imgui.Cond.Always)
		imgui.SetNextWindowPos(imgui.ImVec2(var_233_80, var_233_81), imgui.Cond.Always)
		imgui.Begin("keyboard", nil, imgui.WindowFlags.NoScrollWithMouse + imgui.WindowFlags.NoScrollbar + imgui.WindowFlags.NoTitleBar + imgui.WindowFlags.NoResize)

		local var_233_82 = 12
		local var_233_83 = 1
		local var_233_84 = (imgui.GetWindowContentRegionWidth() - var_233_0.ItemSpacing.x * (var_233_82 - 1)) / var_233_82
		local var_233_85 = (imgui.GetWindowContentRegionMax().y - imgui.GetWindowContentRegionMin().y - var_233_0.ItemSpacing.y * (var_233_83 - 1)) / var_233_83
		local var_233_86 = imgui.ImVec2(var_233_84, var_233_85)

		if imgui.Button("Esc", var_233_86) then
			lua_thread.create(function()
				wait(0)
				setVirtualKeyDown(VK_ESCAPE, true)
				wait(10)
				setVirtualKeyDown(VK_ESCAPE, false)
			end)
		end

		imgui.SameLine()

		if imgui.Button("...", var_233_86) then
			imgui.OpenPopup("buttons")
		end

		if imgui.BeginPopup("buttons") then
			if imgui.Button("/plt", imgui.ImVec2(300, var_233_85)) then
				run_plt()
				imgui.CloseCurrentPopup()
			end

			if imgui.Button("Tab", imgui.ImVec2(300, var_233_85)) then
				lua_thread.create(function()
					wait(0)
					setVirtualKeyDown(VK_TAB, true)
					wait(10)
					setVirtualKeyDown(VK_TAB, false)
				end)
				imgui.CloseCurrentPopup()
			end

			imgui.Separator()

			if imgui.Button("Alt + Tab", imgui.ImVec2(300, var_233_85)) then
				lua_thread.create(function()
					wait(0)
					setVirtualKeyDown(VK_MENU, true)
					wait(10)
					setVirtualKeyDown(VK_TAB, true)
					wait(10)
					setVirtualKeyDown(VK_TAB, false)
					wait(10)
					setVirtualKeyDown(VK_MENU, false)
				end)
				imgui.CloseCurrentPopup()
			end

			if imgui.Button("Ctrl + Shift + Esc", imgui.ImVec2(300, var_233_85)) then
				lua_thread.create(function()
					wait(0)
					setVirtualKeyDown(VK_CONTROL, true)
					setVirtualKeyDown(VK_SHIFT, true)
					wait(10)
					setVirtualKeyDown(VK_ESCAPE, true)
					wait(10)
					setVirtualKeyDown(VK_ESCAPE, false)
					wait(10)
					setVirtualKeyDown(VK_SHIFT, false)
					setVirtualKeyDown(VK_CONTROL, false)
				end)
				imgui.CloseCurrentPopup()
			end

			imgui.Separator()

			if imgui.Button("Alt + Shift", imgui.ImVec2(300, var_233_85)) then
				lua_thread.create(function()
					wait(0)
					setVirtualKeyDown(VK_MENU, true)
					wait(10)
					setVirtualKeyDown(VK_SHIFT, true)
					wait(10)
					setVirtualKeyDown(VK_SHIFT, false)
					wait(10)
					setVirtualKeyDown(VK_MENU, false)
				end)
			end

			if imgui.Button("Ctrl + Shift", imgui.ImVec2(300, var_233_85)) then
				lua_thread.create(function()
					wait(0)
					setVirtualKeyDown(VK_CONTROL, true)
					wait(10)
					setVirtualKeyDown(VK_SHIFT, true)
					wait(10)
					setVirtualKeyDown(VK_SHIFT, false)
					wait(10)
					setVirtualKeyDown(VK_CONTROL, false)
				end)
			end

			imgui.Separator()

			if imgui.Button(u8("Режим ПК"), imgui.ImVec2(300, var_233_85)) then
				set.remote = false

				ecfg.save(filename_set, set)
			end

			imgui.EndPopup()
		end

		imgui.SameLine()

		if false and sampIsChatInputActive() then
			if imgui.Button("UP", var_233_86) then
				lua_thread.create(function()
					wait(0)
					setVirtualKeyDown(VK_UP, true)
					wait(10)
					setVirtualKeyDown(VK_UP, false)
				end)
			end
		else
			imgui.Button("C", var_233_86)

			if imgui.IsItemActive() and isCharOnFoot(PLAYER_PED) then
				table.insert(gogo, {
					state = 128,
					key = game_keys.player.CROUCH
				})
			end
		end

		imgui.SameLine()
		imgui.Button("V", var_233_86)

		if imgui.IsItemActive() then
			if isCharOnFoot(PLAYER_PED) then
				table.insert(gogo, {
					state = 128,
					key = game_keys.player.CHANGECAMERAVIEW
				})
			else
				table.insert(gogo, {
					state = 128,
					key = game_keys.vehicle.CHANGECAMERAVIEW
				})
			end
		end

		imgui.SameLine()
		imgui.Button("N", var_233_86)

		if imgui.IsItemActive() then
			if isCharOnFoot(PLAYER_PED) then
				table.insert(gogo, {
					state = 128,
					key = game_keys.player.CONVERSATIONNO
				})
			else
				table.insert(gogo, {
					state = 128,
					key = game_keys.vehicle.CONVERSATIONNO
				})
			end
		end

		imgui.SameLine()
		imgui.Button("F", var_233_86)

		if imgui.IsItemActive() then
			if isCharOnFoot(PLAYER_PED) then
				table.insert(gogo, {
					state = 128,
					key = game_keys.player.ENTERVEHICLE
				})
			else
				table.insert(gogo, {
					state = 128,
					key = game_keys.vehicle.EXITVEHICLE
				})
			end
		end

		imgui.SameLine()
		imgui.Button("G", var_233_86)

		if imgui.IsItemActive() and isCharOnFoot(PLAYER_PED) then
			table.insert(gogo, {
				state = 128,
				key = game_keys.player.GROUPCONTROLFWD
			})
		end

		imgui.SameLine()
		imgui.Button("H", var_233_86)

		if imgui.IsItemActive() then
			if isCharOnFoot(PLAYER_PED) then
				table.insert(gogo, {
					state = 128,
					key = game_keys.player.GROUPCONTROLBWD
				})
			else
				table.insert(gogo, {
					state = 128,
					key = game_keys.vehicle.HORN
				})
			end
		end

		imgui.SameLine()
		imgui.Button("Y", var_233_86)

		if imgui.IsItemActive() then
			if isCharOnFoot(PLAYER_PED) then
				table.insert(gogo, {
					state = 128,
					key = game_keys.player.CONVERSATIONYES
				})
			else
				table.insert(gogo, {
					state = 128,
					key = game_keys.vehicle.CONVERSATIONYES
				})
			end
		end

		imgui.SameLine()
		imgui.Button("Alt", var_233_86)

		if imgui.IsItemActive() and isCharOnFoot(PLAYER_PED) then
			table.insert(gogo, {
				state = 128,
				key = game_keys.player.WALK
			})
		end

		imgui.SameLine()

		if imgui.Button("F6", var_233_86) then
			if sampIsChatInputActive() then
				sampSetChatInputEnabled(false)
			else
				sampSetChatInputEnabled(true)
			end
		end

		imgui.SameLine()

		if imgui.Button("/", var_233_86) then
			if sampIsChatInputActive() then
				sampSetChatInputEnabled(false)
			else
				sampSetChatInputEnabled(true)
				sampSetChatInputText("/")
			end
		end

		imgui.End()
		imgui.PopStyleColor(4)
		imgui.PopStyleVar(3)
		imgui.PopFont()
	end

	if (sell_current_moving_item or buy_current_moving_item) and (not help.moving_item or help.moving_item and help.moving_item < 4) then
		imgui.SetTooltip(u8("Укажите место, куда хотите переместить товар,\nнажав на нужный кружочек"))
	end

	if EXPORTS.is_working() then
		local var_233_87 = scale(150, set.scale)
		local var_233_88 = scale(100, set.scale)

		imgui.SetNextWindowSize(imgui.ImVec2(var_233_87, var_233_88), imgui.Cond.Always)
		imgui.SetNextWindowPos(imgui.ImVec2(var_233_1 - var_233_87 - 3, var_233_2 / 2 - var_233_88 / 2), imgui.Cond.Always)
		imgui.Begin(u8("Отмена##img.window_buy_average"), window_buy_average, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoScrollWithMouse + imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoTitleBar)

		local var_233_89 = 2
		local var_233_90 = (var_233_88 - var_233_0.ItemSpacing.y - var_233_0.WindowPadding.y * 2) / 2

		if imgui.Button(u8("Прервать"), imgui.ImVec2(-0.4, -0.4)) then
			if alt_thread then
				alt_thread:terminate()
			end

			buy_task = {}
			buy_running = false
			sell_task = {}
			sell_running = false
			sell_vystavit = false
			fatality = false
			auto_number_checking = false
			buy_cancel = false
			sell_cancel = false
			sell_average_parsing_all = false
			sell_average_parsing = false
			buy_average_parsing = false
			buy_average_parsing_all = false
			buy_parsing = false
			buy_do_refresh_list = true
			sell_do_refresh_left_draw_list = true
			buy_do_refresh_top_draw_list = true
			sell_parsing = false
			sell_parsing2 = false
			pause = false
		end

		imgui.End()
	end

	if img.window_buy_average.v then
		local var_233_91 = 320
		local var_233_92 = 260
		local var_233_93 = 24
		local var_233_94 = var_233_1 - var_233_91 - 3
		local var_233_95 = var_233_2 / 2 - var_233_92 / 2
		local var_233_96 = 3
		local var_233_97 = 3
		local var_233_98 = var_233_94
		local var_233_99 = var_233_94 + 100
		local var_233_100 = var_233_94 + 190
		local var_233_101 = sampGetDialogText():gsub("{%x%x%x%x%x%x}", ""):match("^[^:]+: ([^\r\n]+)") or "< Ошибка >"

		renderDrawBox(var_233_94, var_233_95, var_233_91, var_233_92, 4279376929)
		renderDrawLine(var_233_94, var_233_95 + var_233_93, var_233_94 + var_233_91, var_233_95 + var_233_93, 1, 4285427327)
		renderDrawLine(var_233_99, var_233_95 + var_233_93, var_233_99, var_233_95 + var_233_92, 1, 4285427327)
		renderDrawLine(var_233_100, var_233_95 + var_233_93, var_233_100, var_233_95 + var_233_92, 1, 4285427327)

		local var_233_102 = var_233_95

		renderFontDrawText(FONT, var_233_101, var_233_98 + var_233_96, var_233_102 + var_233_97, 2862193049)

		local var_233_103 = var_233_102 + var_233_93

		renderFontDrawText(FONT, "Дата", var_233_98 + var_233_96, var_233_103 + var_233_97, 2868903935)
		renderFontDrawText(FONT, "Штук", var_233_99 + var_233_96, var_233_103 + var_233_97, 2868903935)
		renderFontDrawText(FONT, "Средняя цена", var_233_100 + var_233_96, var_233_103 + var_233_97, 2868903935)
		renderDrawLine(var_233_94, var_233_103 + var_233_93, var_233_94 + var_233_91, var_233_103 + var_233_93, 1, 4285427327)

		local var_233_104 = var_233_103 + var_233_93

		if buy_average_price[getArizonaName()] and buy_average_price[getArizonaName()][var_233_101] and buy_average_price[getArizonaName()][var_233_101].list then
			for iter_233_0, iter_233_1 in ipairs(buy_average_price[getArizonaName()][var_233_101].list) do
				renderFontDrawText(FONT, iter_233_1[1], var_233_98 + var_233_96, var_233_104 + var_233_97, 2868903935)
				renderDrawLine(var_233_94, var_233_104 + var_233_93, var_233_94 + var_233_91, var_233_104 + var_233_93, 1, 4285427327)
				renderFontDrawText(FONT, sep(iter_233_1[2]) .. " шт.", var_233_99 + var_233_96, var_233_104 + var_233_97, 2868903935)
				renderFontDrawText(FONT, sep(math.ceil(iter_233_1[3] / iter_233_1[2])) .. " $", var_233_100 + var_233_96, var_233_104 + var_233_97, 2868903935)

				if iter_233_0 == 5 then
					break
				end

				var_233_104 = var_233_104 + var_233_93
			end
		end
	end

	if img.window_sell_average.v then
		local var_233_105 = 320
		local var_233_106 = 260
		local var_233_107 = 24
		local var_233_108 = var_233_1 - var_233_105 - 3
		local var_233_109 = var_233_2 / 2 - var_233_106 / 2
		local var_233_110 = 3
		local var_233_111 = 3
		local var_233_112 = var_233_108
		local var_233_113 = var_233_108 + 100
		local var_233_114 = var_233_108 + 190
		local var_233_115 = sampGetDialogText():gsub("{%x%x%x%x%x%x}", ""):match("^[^:]+: ([^\r\n]+)") or "< Ошибка >"

		renderDrawBox(var_233_108, var_233_109, var_233_105, var_233_106, 4279376929)
		renderDrawLine(var_233_108, var_233_109 + var_233_107, var_233_108 + var_233_105, var_233_109 + var_233_107, 1, 4285427327)
		renderDrawLine(var_233_113, var_233_109 + var_233_107, var_233_113, var_233_109 + var_233_106, 1, 4285427327)
		renderDrawLine(var_233_114, var_233_109 + var_233_107, var_233_114, var_233_109 + var_233_106, 1, 4285427327)

		local var_233_116 = var_233_109

		renderFontDrawText(FONT, var_233_115, var_233_112 + var_233_110, var_233_116 + var_233_111, 2862193049)

		local var_233_117 = var_233_116 + var_233_107

		renderFontDrawText(FONT, "Дата", var_233_112 + var_233_110, var_233_117 + var_233_111, 2868903935)
		renderFontDrawText(FONT, "Штук", var_233_113 + var_233_110, var_233_117 + var_233_111, 2868903935)
		renderFontDrawText(FONT, "Средняя цена", var_233_114 + var_233_110, var_233_117 + var_233_111, 2868903935)
		renderDrawLine(var_233_108, var_233_117 + var_233_107, var_233_108 + var_233_105, var_233_117 + var_233_107, 1, 4285427327)

		local var_233_118 = var_233_117 + var_233_107

		if sell_average_price[getArizonaName()] and sell_average_price[getArizonaName()][var_233_115:gsub("%(%+%d+%)", "")] and sell_average_price[getArizonaName()][var_233_115:gsub("%(%+%d+%)", "")].list then
			for iter_233_2, iter_233_3 in ipairs(sell_average_price[getArizonaName()][var_233_115:gsub("%(%+%d+%)", "")].list) do
				renderFontDrawText(FONT, iter_233_3[1], var_233_112 + var_233_110, var_233_118 + var_233_111, 2868903935)
				renderDrawLine(var_233_108, var_233_118 + var_233_107, var_233_108 + var_233_105, var_233_118 + var_233_107, 1, 4285427327)
				renderFontDrawText(FONT, sep(iter_233_3[2]) .. " шт.", var_233_113 + var_233_110, var_233_118 + var_233_111, 2868903935)
				renderFontDrawText(FONT, sep(math.ceil(iter_233_3[3] / iter_233_3[2])) .. " $", var_233_114 + var_233_110, var_233_118 + var_233_111, 2868903935)

				if iter_233_2 == 5 then
					break
				end

				var_233_118 = var_233_118 + var_233_107
			end
		end
	end

	if img.window_menu.v then

		if version and version ~= __version__ and set.ignore_ver ~= version and not ver_popup_is_closed then
			imgui.OpenPopup(u8("Внимание!"))
		end

		if imgui.BeginPopupModal(u8("Внимание!"), nil, imgui.WindowFlags.NoScrollWithMouse + imgui.WindowFlags.NoScrollbar + imgui.WindowFlags.NoTitleBar + imgui.WindowFlags.NoResize + imgui.WindowFlags.NoMove) then
			imgui.SetWindowSize(imgui.ImVec2(scale(360, set.scale), scale(270, set.scale)))
			imgui.TextColored(tmp.color_orange, u8("Доступно обновление: ") .. version)
			imgui.Separator()
			imgui.TextColored(tmp.color_orange, u8("- Где скачать?"))
			imgui.Text(u8("- В телеграм канале."))
			imgui.NewLine()
			imgui.TextColored(tmp.color_orange, u8("- Как попасть в телеграм канал?"))
			imgui.Text(u8("- Ссылка на него находится в описании к файлу скрипта.\nВ чате с автором скрипта."))
			imgui.NewLine()
			imgui.Checkbox(u8("Игнорировать это обновление"), img.ignore_ver)

			if imgui.Button(u8("Закрыть"), imgui.ImVec2(-0.4, -0.4)) then
				ver_popup_is_closed = true

				imgui.CloseCurrentPopup()

				if img.ignore_ver.v then
					set.ignore_ver = version

					ecfg.save(filename_set, set)
				end
			end

			imgui.EndPopup()
		end

		imgui.SetNextWindowSize(imgui.ImVec2(set.menu_size.w, set.menu_size.h), imgui.Cond.FirstUseEver)
		imgui.SetWindowPosBegin("img.window_menu", set.menu_pos.x, set.menu_pos.y, imgui.Cond.FirstUseEver, tmp.allow_move)

		local var_233_119 = true

		if var_233_119 then
			imgui.PushStyleColor(imgui.Col.Text, tmp.color_orange)
		end

		imgui.Begin("##img.window_menu", img.window_menu, imgui.WindowFlags.NoScrollWithMouse + imgui.WindowFlags.NoScrollbar + imgui.WindowFlags.NoTitleBar)
		imgui.PushStyleColor(imgui.Col.Text, tmp.color_text)

		local var_233_120 = imgui.GetWindowWidth()
		local var_233_121 = imgui.GetWindowHeight()
		local var_233_122 = imgui.GetWindowPos().x
		local var_233_123 = imgui.GetWindowPos().y

		if true or set.small then
			imgui.BeginChild("title", imgui.ImVec2(0, imgui.GetFontSize() + var_233_0.FramePadding.y * 2), false, imgui.WindowFlags.NoScrollWithMouse)

			local var_233_124

			if set.current_tab == "buy" then
				var_233_124 = u8("Скупка")
			elseif set.current_tab == "sell" then
				var_233_124 = u8("Продажа")
			elseif set.current_tab == "settings" then
				var_233_124 = u8("Настройки")
			elseif set.current_tab == "about" then
				var_233_124 = u8("Помощь")
			else
				var_233_124 = u8("Меню")
			end

			imgui.PushStyleVar(imgui.StyleVar.ButtonTextAlign, imgui.ImVec2(0, 0.5))

			if set.small and imgui.ButtonSelectable(true, false, fa.ICON_FA_BARS .. " " .. var_233_124, imgui.ImVec2(scale(100, set.scale), 0)) then
				imgui.OpenPopup("tabs")
			end

			imgui.PopStyleVar()
			imgui.SameLine()

			local var_233_125 = MAIN_TITLE .. " " .. __version__ .. (var_233_119 and u8(" (Старая)") or "") .. (arizona_name and " | " .. arizona_name or "") .. (arizona_name == "Vice City" and set.sa_name and " | " .. set.sa_name or "")
			local var_233_126 = imgui.CalcTextSize(var_233_125)
			local var_233_127 = imgui.GetWindowContentRegionWidth() - imgui.GetContentRegionAvail().x
			local var_233_128 = imgui.GetFrameHeight() * 2 + var_233_0.ItemInnerSpacing.x + var_233_0.ItemSpacing.x
			local var_233_129 = imgui.GetContentRegionAvail().x - var_233_128

			imgui.SetCursorPosX(var_233_127 + (var_233_129 / 2 - var_233_126.x / 2))

			if var_233_119 then
				imgui.TextColored(tmp.color_orange, var_233_125)
			else
				imgui.Text(var_233_125)
			end

			imgui.SameLine(imgui.GetWindowContentRegionWidth() - imgui.GetFrameHeight() * 2 - var_233_0.ItemInnerSpacing.x)

			if var_233_120 == var_233_1 and var_233_121 == var_233_2 and var_233_122 == 0 and var_233_123 == 0 and set.menu_last_pos and set.menu_last_size then
				if imgui.ButtonSelectable(true, false, fa.ICON_FA_COMPRESS, imgui.ImVec2(imgui.GetFrameHeight(), imgui.GetFrameHeight())) then
					set.menu_pos.x = set.menu_last_pos.x
					set.menu_pos.y = set.menu_last_pos.y
					imgui.SetWindowPosBegin._pos["img.window_menu"] = nil

					imgui.SetWindowSize("##img.window_menu", imgui.ImVec2(set.menu_last_size.w, set.menu_last_size.h))
					imgui.SetWindowPos("##img.window_menu", imgui.ImVec2(set.menu_pos.x, set.menu_pos.y))
				end
			elseif imgui.ButtonSelectable(true, false, fa.ICON_FA_EXPAND, imgui.ImVec2(imgui.GetFrameHeight(), imgui.GetFrameHeight())) then
				set.menu_last_pos = {
					x = var_233_122,
					y = var_233_123
				}
				set.menu_last_size = {
					w = var_233_120,
					h = var_233_121
				}
				set.menu_pos.x = 0
				set.menu_pos.y = 0
				imgui.SetWindowPosBegin._pos["img.window_menu"] = nil

				imgui.SetWindowSize("##img.window_menu", imgui.ImVec2(var_233_1, var_233_2))
				imgui.SetWindowPos("##img.window_menu", imgui.ImVec2(set.menu_pos.x, set.menu_pos.y))
			end

			imgui.SameLineItemInnerSpacing()

			if imgui.ButtonSelectable(true, false, fa.ICON_FA_TIMES, imgui.ImVec2(imgui.GetFrameHeight(), imgui.GetFrameHeight())) then
				img.window_menu.v = false
			end

			if imgui.BeginPopup("tabs") then
				local var_233_130 = scale(200, set.scale)

				if imgui.SelectableEx(true, u8("Скупка"), set.current_tab == "buy", nil, imgui.ImVec2(var_233_130, 0)) then
					sell_current_moving_item = nil
					buy_current_moving_item = nil
					set.current_tab = "buy"
					tmp.popup_tab = nil

					ecfg.save(filename_set, set)

					buy_do_refresh_list = true
					buy_do_refresh_top_draw_list = true
					buy_do_refresh_right_draw_list = true
				end

				if imgui.SelectableEx(true, u8("Продажа"), set.current_tab == "sell", nil, imgui.ImVec2(var_233_130, 0)) then
					sell_current_moving_item = nil
					buy_current_moving_item = nil
					set.current_tab = "sell"
					tmp.popup_tab = nil

					ecfg.save(filename_set, set)

					sell_do_refresh_right_draw_list = true
					sell_do_refresh_left_draw_list = true
				end

				imgui.Separator()

				local var_233_131 = sampGetDialogText():gsub("{%x%x%x%x%x%x}", "")
				local var_233_132 = sampIsDialogActive() and var_233_131:find("Добавить товар на покупку", 1, true)
				local var_233_133 = sampIsDialogActive() and var_233_131:find("Название\tСкупаете\tСтоимость", 1, true)

				if imgui.SelectableEx(var_233_132 or var_233_133, u8("Сканировать все товары"), false, nil, imgui.ImVec2(var_233_130, 0)) then
					sell_current_moving_item = nil
					buy_current_moving_item = nil
					buy_dubl = {}
					buy_parsing = true
					tmp.popup_tab = nil

					if var_233_132 then
						temp_buy_list = {}
						temp_buy_dlist = {}
						img.window_menu.v = false

						sampSendDialogResponse(sampGetCurrentDialogId(), 1, 1, "Добавить товар на покупку")
					elseif var_233_133 then
						temp_buy_list = {}
						temp_buy_dlist = {}

						sampSendDialogResponse(sampGetCurrentDialogId(), 0, 0, "")
					end
				end

				if (not var_233_132 or var_233_133) and imgui.IsItemHovered() then
					-- block empty
				end

				imgui.Separator()

				if imgui.SelectableEx(true, u8("Настройки"), set.current_tab == "settings", nil, imgui.ImVec2(var_233_130, 0)) then
					sell_current_moving_item = nil
					buy_current_moving_item = nil
					set.current_tab = "settings"
					tmp.popup_tab = nil

					ecfg.save(filename_set, set)
					imgui.CloseCurrentPopup()
				end

				imgui.Separator()

				if imgui.SelectableEx(true, u8("Перезапустить скрипт"), false, nil, imgui.ImVec2(var_233_130, 0)) then
					set.open_script = true

					ecfg.save(filename_set, set)

					tmp.popup_tab = nil

					script.this:reload()
					imgui.CloseCurrentPopup()
				end

				imgui.EndPopup()
			end

			imgui.EndChild()

			if imgui.IsMouseDown(0) then
				tmp.allow_move = (imgui.IsItemHovered() or tmp.allow_move) and (var_233_120 ~= var_233_1 or var_233_121 ~= var_233_2 or var_233_122 ~= 0 or var_233_123 ~= 0)
			else
				tmp.allow_move = false
			end
		end

		window_menu_collapsed = imgui.IsWindowCollapsed()

		if uncollapse then
			uncollapse = false

			imgui.SetWindowCollapsed(false)
		end

		if not set.small then

			imgui.BeginChild("tabs", imgui.ImVec2(scale(82, set.scale), 0), false, imgui.WindowFlags.NoScrollWithMouse + imgui.WindowFlags.NoScrollbar)

			local var_233_134 = -0.4
			local var_233_135 = scale(40, set.scale)

			if imgui.ButtonSelectable(true, set.current_tab == "buy", u8("Скупка"), imgui.ImVec2(var_233_134, var_233_135)) then
				sell_current_moving_item = nil
				buy_current_moving_item = nil
				set.current_tab = "buy"
				tmp.popup_tab = nil

				ecfg.save(filename_set, set)

				buy_do_refresh_list = true
				buy_do_refresh_top_draw_list = true
				buy_do_refresh_right_draw_list = true
			end

			if imgui.ButtonSelectable(true, set.current_tab == "sell", u8("Продажа"), imgui.ImVec2(var_233_134, var_233_135)) then
				sell_current_moving_item = nil
				buy_current_moving_item = nil
				set.current_tab = "sell"
				tmp.popup_tab = nil

				ecfg.save(filename_set, set)

				sell_do_refresh_right_draw_list = true
				sell_do_refresh_left_draw_list = true
			end

			local var_233_136 = sampGetDialogText():gsub("{%x%x%x%x%x%x}", "")
			local var_233_137 = sampIsDialogActive() and var_233_136:find("Добавить товар на покупку", 1, true)
			local var_233_138 = sampIsDialogActive() and var_233_136:find("Название\tСкупаете\tСтоимость", 1, true)

			imgui.Separator()

			if imgui.ButtonSelectable(var_233_137 or var_233_138, false, u8("Сканировать\n все товары"), imgui.ImVec2(var_233_134, var_233_135)) then
				sell_current_moving_item = nil
				buy_current_moving_item = nil
				buy_dubl = {}
				buy_parsing = true
				tmp.popup_tab = nil

				if var_233_137 then
					temp_buy_list = {}
					temp_buy_dlist = {}
					img.window_menu.v = false

					sampSendDialogResponse(sampGetCurrentDialogId(), 1, 1, "Добавить товар на покупку")
				elseif var_233_138 then
					temp_buy_list = {}
					temp_buy_dlist = {}

					sampSendDialogResponse(sampGetCurrentDialogId(), 0, 0, "")
				end
			end

			if (not var_233_137 or var_233_138) and imgui.IsItemHovered() then
				imgui.SetTooltip(u8("Чтобы сканировать все товары:\n1. Возьмите лавку\n2. Нажмите клавишу Alt\n3. Выберите пункт Palatka.lua\n4. Эта кнопка станет активной"))
			end

			imgui.Separator()

			if imgui.ButtonSelectable(true, set.current_tab == "settings", u8("Настройки"), imgui.ImVec2(var_233_134, var_233_135)) then
				sell_current_moving_item = nil
				buy_current_moving_item = nil
				set.current_tab = "settings"
				tmp.popup_tab = nil

				ecfg.save(filename_set, set)
			end

			imgui.BeginChild("space", imgui.ImVec2(0, scale(-55, set.scale)))
			imgui.EndChild()
			imgui.Separator()

			if imgui.Link2(u8(" Перезапуск\n   скрипта")) then
				set.open_script = true

				ecfg.save(filename_set, set)
				script.this:reload()
			end

			imgui.EndChild()
			imgui.SameLine()

		end

		i = true -- penis

		 --type(i == false and imgui.BeginChild(""))

		--imgui.BeginChild("body", imgui.Vec2(0, 0), False)

		-- imgui.BeginChild("body", imgui.ImVec2(0, 0), false, imgui.WindowFlags.NoScrollbar) --СЫН ШЛЮХИ

		if tmp.popup_tab == "buy/playlists" or tmp.popup_tab == "sell/playlists" then

			--imgui.BeginChild("goal", imgui.ImVec2(0, 0), false, imgui.WindowFlags.AlwaysUseWindowPadding + imgui.WindowFlags.NoScrollWithMouse + imgui.WindowFlags.NoScrollbar)

			if imgui.Button(fa.ICON_FA_REPLY .. u8(" Назад"), imgui.ImVec2(-0.4, 0)) then
				tmp.popup_tab = nil
			end

			imgui.BeginChild("playlist buttons", imgui.ImVec2(scale(200, set.scale), 0), true, imgui.WindowFlags.AlwaysUseWindowPadding + ((set.scroller or set.scroller_smooth) and imgui.WindowFlags.NoScrollWithMouse or 0))

			if set.scroller or set.scroller_smooth then
				imgui.Scroller("playlist buttons", imgui.GetFrameHeight() * 3, set.scroller_smooth and set.scroller_duration or 0)
			end

			if imgui.Button(u8("Копировать"), imgui.ImVec2(-0.4, 0)) then
				if tmp.popup_tab == "buy/playlists" then
					copy_buffer = deepcopy(buy_playlist)
				elseif tmp.popup_tab == "sell/playlists" then
					copy_buffer = deepcopy(sell_playlist)
				end

				imgui.TNotif.click(u8("Готово"))
			end

			if imgui.ButtonClickable(copy_buffer, u8("Вставить"), imgui.ImVec2(-0.4, 0)) then
				if tmp.popup_tab == "buy/playlists" then
					buy_paste(copy_buffer, buy_playlist, set.paste_mode)

					if set.paste_mode == "add" then
						buy_right_scroll = "down"
					end
				elseif tmp.popup_tab == "sell/playlists" then
					sell_paste(copy_buffer, sell_playlist, set.paste_mode)

					if set.paste_mode == "add" then
						sell_right_scroll = "down"
					end
				end

				imgui.TNotif.click(u8("Готово"))
			end

			if imgui.RadioButton(u8("Заменять цены"), set.paste_mode == "price_only") then
				set.paste_mode = "price_only"

				ecfg.save(filename_set, set)
			end

			if imgui.RadioButton(u8("Добавлять элементы"), set.paste_mode == "add") then
				set.paste_mode = "add"

				ecfg.save(filename_set, set)
			end

			imgui.NewLine()

			if imgui.ButtonClickable(set.current_playlist ~= "Основной.cfg", u8("Переименовать"), imgui.ImVec2(-0.4, 0)) then
				playlist_renaming = true
				playlist_renaming_focus = true

				local var_233_139 = set.current_playlist:gsub("%.cfg$", "")

				img.create_buffer.v = u8(var_233_139)
			end

			imgui.NewLine()
			imgui.Separator()
			imgui.PushItemWidth(scale(40, set.scale))

			local var_233_140 = buy_playlist.price_value ~= "$"

			if var_233_140 then
				imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
			end

			if imgui.InputIntEx(u8("$    ") .. fa.ICON_FA_LONG_ARROW_ALT_RIGHT .. "    ##img.buy_vc", img.buy_vc, 0, 0) then
				set.buy_vc = img.buy_vc.v

				ecfg.save(filename_set, set)
			end

			imgui.SameLineItemInnerSpacing()
			imgui.Text("1 VC$")

			if var_233_140 then
				imgui.PopStyleColor()
			end

			local var_233_141 = buy_playlist.price_value ~= "VC$"

			if var_233_141 then
				imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
			end

			imgui.AlignTextToFramePadding()

			if imgui.InputIntEx(u8("$    ") .. fa.ICON_FA_LONG_ARROW_ALT_LEFT .. "##img.buy_sa", img.buy_sa, 0, 0) then
				set.buy_sa = img.buy_sa.v

				ecfg.save(filename_set, set)
			end

			imgui.SameLineItemInnerSpacing()
			imgui.Text(u8("    1 VC$"))

			if var_233_141 then
				imgui.PopStyleColor()
			end

			if buy_playlist.price_value == "$" then
				if imgui.ButtonClickable(buy_playlist.price_value == "$", u8("Конвертировать в VC$"), imgui.ImVec2(-0.4, 0)) then
					exchange_sa_to_vc()
					imgui.TNotif.click(u8("Готово"))
				end
			elseif buy_playlist.price_value == "VC$" and imgui.ButtonClickable(buy_playlist.price_value == "VC$", u8("Конвертировать в $"), imgui.ImVec2(-0.4, 0)) then
				exchange_vc_to_sa()
				imgui.TNotif.click(u8("Готово"))
			end

			imgui.NewLine()
			imgui.Separator()

			if imgui.Button(u8("Очистить##..._clear_current_playlist()"), imgui.ImVec2(-0.4, 0)) then
				if tmp.popup_tab == "buy/playlists" then
					buy_clear_current_playlist()
				elseif tmp.popup_tab == "sell/playlists" then
					sell_clear_current_playlist()
				end

				imgui.TNotif.click(u8("Готово"))
			end

			if imgui.ButtonClickable(set.current_playlist ~= "Основной.cfg", u8("Удалить"), imgui.ImVec2(-0.4, 0)) then
				remove_current_playlist()
				refresh_playlists()
			end

			if imgui.IsItemHovered() then
				imgui.SetTooltip(u8("Удаляется и скупка и продажа!"))
			end

			imgui.EndChild()
			imgui.SameLine()
			imgui.BeginChild("playlists", imgui.ImVec2(0, 0), true, imgui.WindowFlags.AlwaysUseWindowPadding + imgui.WindowFlags.NoScrollWithMouse + imgui.WindowFlags.NoScrollbar)
			imgui.BeginChild("playlists top", imgui.ImVec2(0, -(imgui.GetFrameHeight() + var_233_0.ItemSpacing.y)), false, imgui.WindowFlags.AlwaysUseWindowPadding + ((set.scroller or set.scroller_smooth) and imgui.WindowFlags.NoScrollWithMouse or 0))

			if set.scroller or set.scroller_smooth then
				imgui.Scroller("playlists top", imgui.GetFrameHeight() * 3, set.scroller_smooth and set.scroller_duration or 0)
			end

			for iter_233_4, iter_233_5 in ipairs(playlists) do
				if imgui.SelectableEx(true, u8(iter_233_5):gsub("%.[^.]+$", ""), iter_233_5 == set.current_playlist) then
					if iter_233_5 == set.current_playlist then
						tmp.popup_tab = nil
					end

					set.current_playlist = iter_233_5

					ecfg.save(filename_set, set)
					load_current_playlist()
				end
			end

			imgui.EndChild()
			imgui.BeginChild("create_playlist", imgui.ImVec2(0, 0), false, imgui.WindowFlags.NoScrollWithMouse)
			imgui.PushItemWidth(scale(-100, set.scale))

			local var_233_142

			if playlist_renaming then
				var_233_142 = imgui.InputTextEx("##img.create_buffer", img.create_buffer, imgui.InputTextFlags.AutoSelectAll + imgui.InputTextFlags.EnterReturnsTrue)
			else
				var_233_142 = imgui.InputText("##img.create_buffer", img.create_buffer, imgui.InputTextFlags.AutoSelectAll + imgui.InputTextFlags.EnterReturnsTrue)
			end

			if playlist_renaming_focus then
				imgui.SetKeyboardFocusHere()

				playlist_renaming_focus = false
			end

			imgui.SameLine()

			if playlist_renaming then
				if imgui.Button(u8("Сохранить"), imgui.ImVec2(-0.4, 0)) or var_233_142 then
					if is_safe(img.create_buffer.v) then
						local var_233_143 = u8:decode(img.create_buffer.v .. ".cfg")

						playlist_renaming = false

						ecfg.mkpath(directory_buy .. "\\" .. var_233_143)
						ecfg.mkpath(directory_sell .. "\\" .. var_233_143)
						os.rename(directory_buy .. "\\" .. set.current_playlist, directory_buy .. "\\" .. var_233_143)
						os.rename(directory_sell .. "\\" .. set.current_playlist, directory_sell .. "\\" .. var_233_143)

						set.current_playlist = var_233_143
						img.create_buffer.v = ""

						ecfg.save(filename_set, set)
						refresh_playlists()
						imgui.TNotif.add(u8("Готово"))
					else
						playlist_renaming = false
						img.create_buffer.v = ""

						imgui.TNotif.add(u8("Ошибка"))
					end
				end
			elseif imgui.Button(u8("Создать"), imgui.ImVec2(-0.4, 0)) or var_233_142 then
				create_playlist(u8:decode(img.create_buffer.v), true)

				if is_safe(img.create_buffer.v) then
					imgui.TNotif.add(u8("Готово"))
				else
					imgui.TNotif.add(u8("Ошибка"))
				end

				img.create_buffer.v = ""
			end

			imgui.EndChild()
			imgui.EndChild()

		end

		if set.current_tab == "buy" and not tmp.popup_tab then
			local var_233_144 = set.small and 1 or 2.1
			local var_233_145 = var_233_0.ItemSpacing.x * (var_233_144 - 1)
			local var_233_146 = imgui.GetWindowContentRegionMax().x - var_233_145
			local var_233_147 = var_233_146 / var_233_144
			local var_233_148 = var_233_146 - var_233_147

			if set.small_state == "left" or not set.small then
				imgui.BeginChild("buy left", imgui.ImVec2(var_233_147, 0), false, imgui.WindowFlags.NoScrollWithMouse + imgui.WindowFlags.NoScrollbar)

				local var_233_149 = sampGetDialogText():gsub("{%x%x%x%x%x%x}", "")

				if sampIsDialogActive() then
					local var_233_150 = var_233_149:find("Добавить товар на покупку", 1, true)
				end

				if sampIsDialogActive() then
					local var_233_151 = var_233_149:find("Название\tСкупаете\tСтоимость", 1, true)
				end

				if sampIsDialogActive() then
					local var_233_152 = var_233_149:find("Средние цены товаров при скупке", 1, true)
				end

				if imgui.BeginPopup("buy_average_popup") then
					imgui.EndPopup()
				end

				if set.small and (not imgui.InvisibleButton(u8("Обновить инвентарь"), imgui.ImVec2(set.small and -(100 + var_233_0.ItemSpacing.x) or -0.4, imgui.GetFrameHeight())) or true) then
					imgui.SameLine()

					if imgui.Button(fa.ICON_FA_LONG_ARROW_ALT_RIGHT, imgui.ImVec2(100, 0)) then
						set.small_state = "right"

						ecfg.save(filename_set, set)
					end
				end

				if imgui.Checkbox(u8("Добавлять наверх"), img.to_start) then
					set.to_start = img.to_start.v

					ecfg.save(filename_set, set)
				end

				if set.small then
					imgui.SameLine()
				end

				if imgui.Checkbox(u8("Только популярные за##img.buy_top"), img.buy_top) then
					set.buy_top = img.buy_top.v

					ecfg.save(filename_set, set)
				end

				imgui.SameLineItemInnerSpacing()
				imgui.PushItemWidth(scale(25, set.scale))

				if imgui.InputIntEx(u8("дней##iimg.buy_top_days"), img.buy_top_days, 0) then
					if img.buy_top_days.v < 1 then
						img.buy_top_days.v = 1
					elseif img.buy_top_days.v > 31 then
						img.buy_top_days.v = 31
					end

					set.buy_top_days = img.buy_top_days.v

					refresh_buy_top_list()
					ecfg.save(filename_set, set)
				end

				imgui.PopItemWidth()
				imgui.BeginChild("buy left 2", imgui.ImVec2(0, 0), true, imgui.WindowFlags.NoScrollWithMouse + imgui.WindowFlags.NoScrollbar)

				if img.search_buffer.v ~= "" then
					if imgui.ButtonRed(img.search_buffer.v ~= "", u8("Стереть##img.search_buffer")) then
						buy_do_refresh_list = true
						buy_do_refresh_top_draw_list = true
						img.search_buffer.v = ""
					end
				elseif imgui.ButtonClickable(img.search_buffer.v ~= "", u8("Стереть##img.search_buffer")) then
					buy_do_refresh_list = true
					buy_do_refresh_top_draw_list = true
					img.search_buffer.v = ""
				end

				imgui.SameLineItemInnerSpacing()
				imgui.PushItemWidth(-0.4)

				if imgui.InputText("##img.search_buffer", img.search_buffer, imgui.InputTextFlags.AutoSelectAll) then
					buy_do_refresh_list = true
					buy_do_refresh_top_draw_list = true
				end

				imgui.BeginChild("buy left 3" .. (set.buy_top and "*" or "") .. (img.search_buffer.v ~= "" and "+" or ""), imgui.ImVec2(0, 0), false, imgui.WindowFlags.AlwaysUseWindowPadding + ((set.scroller or set.scroller_smooth) and imgui.WindowFlags.NoScrollWithMouse or 0))

				local var_233_153 = getArizonaName()

				if set.scroller or set.scroller_smooth then
					if set.buy_top and #buy_top_draw_list > 0 and sell_average_price[var_233_153] and buy_average_price[var_233_153] and #buy_list ~= 0 then
						local var_233_154 = imgui.GetFontSize() * 2 + var_233_0.ItemSpacing.y

						imgui.Scroller("ТопСкупка", var_233_154, set.scroller_smooth and set.scroller_duration or 0)
					else
						local var_233_155 = (imgui.GetFontSize() + var_233_0.ItemSpacing.y) * 3

						imgui.Scroller("леваяСкупка", var_233_155, set.scroller_smooth and set.scroller_duration or 0)
					end
				end

				if set.buy_top and sell_average_price[var_233_153] and buy_average_price[var_233_153] and #buy_list ~= 0 then
					if buy_do_refresh_top_draw_list then
						buy_top_draw_list = {}

						for iter_233_6, iter_233_7 in ipairs(buy_top_list) do
							if buy_do_refresh_top_draw_list and ru.lower(iter_233_7):find(ru.lower(u8:decode(img.search_buffer.v)), 1, true) and buy_dlist[iter_233_7] then
								table.insert(buy_top_draw_list, iter_233_7)
							end
						end
					end

					buy_do_refresh_top_draw_list = false

					local var_233_156 = imgui.ImGuiListClipper(#buy_top_draw_list)

					while var_233_156:Step() do
						for iter_233_8 = var_233_156.DisplayStart + 1, var_233_156.DisplayEnd do
							local var_233_157 = buy_top_draw_list[iter_233_8]

							if not buy_dplaylist[var_233_157] then
								if imgui.Selectable(u8(var_233_157 .. "\nВ среднем сделок в день: " .. buy_top_rank[var_233_157] .. " раз(а)")) then
									buy_add_item(var_233_157)

									if set.to_start then
										buy_right_scroll = "up"
									else
										buy_right_scroll = "down"
									end
								end
							else
								imgui.TextDisabled(u8(var_233_157 .. "\nВ среднем сделок в день: " .. buy_top_rank[var_233_157] .. " раз(а)"))
							end
						end
					end
				end

				if #buy_list == 0 then
					imgui.TextColoredRGB(u8("{FF8800}Сканируй все товары:"))
					imgui.TextColoredRGB(u8("{FF8800}  1. Возьмите лавку"))
					imgui.TextColoredRGB(u8("{FF8800}  2. Нажмите клавишу Alt"))
					imgui.TextColoredRGB(u8("{FF8800}  3. Выберите пункт Palatka.lua"))
					imgui.TextColoredRGB(u8("{FF8800}  4. Слева нажми \"Сканировать все товары\""))
				elseif set.buy_top and #buy_top_draw_list < 1 or not set.buy_top then
					if buy_do_refresh_list then
						buy_do_refresh_list = false
						buy_do_refresh_top_draw_list = true
						buy_draw_list = {}

						for iter_233_9, iter_233_10 in ipairs(buy_list) do
							if ru.lower(iter_233_10):find(ru.lower(u8:decode(img.search_buffer.v)), 1, true) then
								table.insert(buy_draw_list, iter_233_10)
							end
						end
					end

					local var_233_158 = imgui.ImGuiListClipper(#buy_draw_list)

					while var_233_158:Step() do
						for iter_233_11 = var_233_158.DisplayStart + 1, var_233_158.DisplayEnd do
							local var_233_159 = buy_draw_list[iter_233_11]

							if not buy_dplaylist[var_233_159] then
								if imgui.Selectable(u8(var_233_159)) then
									buy_add_item(var_233_159)

									if set.to_start then
										buy_right_scroll = "up"
									else
										buy_right_scroll = "down"
									end
								end
							else
								imgui.TextDisabled(u8(var_233_159))
							end
						end
					end
				end

				imgui.EndChild()
				imgui.EndChild()
				imgui.EndChild()
				imgui.SameLine()
			end

			if set.small_state == "right" or not set.small then
				imgui.BeginChild("buy right", imgui.ImVec2(var_233_148, 0), false, imgui.WindowFlags.NoScrollWithMouse + imgui.WindowFlags.NoScrollbar)

				if imgui.BeginPopup("playlist") then
					local var_233_160 = math.min(scale(2000, set.scale), var_233_1 - var_233_0.WindowPadding.y * 2)
					local var_233_161 = math.min(scale(1000, set.scale), var_233_2 - var_233_0.WindowPadding.y * 2)

					imgui.BeginChild("playlist popup", imgui.ImVec2(0, 0), true)
					imgui.EndChild()
					imgui.EndPopup()
				end

				if set.small then
					if imgui.Button(fa.ICON_FA_LONG_ARROW_ALT_LEFT, imgui.ImVec2(100, 0)) then
						set.small_state = "left"

						ecfg.save(filename_set, set)
					end

					imgui.SameLine()
				end

				if imgui.Button(u8(set.current_playlist):gsub("%.[^.]+$", "") .. u8("  |  ") .. buy_playlist.price_value .. "##playlist", imgui.ImVec2(-0.4, 0)) then
					sell_current_moving_item = nil
					buy_current_moving_item = nil

					refresh_playlists()

					tmp.popup_tab = "buy/playlists"
				end

				local var_233_162 = 4
				local var_233_163 = var_233_0.ItemSpacing.x * (var_233_162 - 1)
				local var_233_164 = (imgui.GetWindowContentRegionMax().x - var_233_163) / 5.2

				if imgui.ButtonRed(set.dynamic, u8("Продолжить"), imgui.ImVec2(var_233_164, 0)) then
					set.dynamic = not set.dynamic

					if not help["set.dynamic"] then
						help["set.dynamic"] = 1
					else
						help["set.dynamic"] = help["set.dynamic"] + 1
					end

					buy_do_refresh_right_draw_list = true
					sell_do_refresh_right_draw_list = true

					ecfg.save(filename_help, help)
					ecfg.save(filename_set, set)
				end

				if (not help["set.dynamic"] or help["set.dynamic"] and help["set.dynamic"] < 3) and imgui.IsItemHovered() then
					imgui.SetTooltip(u8("Включите эту функцию после потери лавки,\nчтобы продолжить скупку в запланированном количестве.\n\nПосле включения нажмите кнопку \"Выставить\"."))
				end

				imgui.SameLine()

				if imgui.ButtonClickable(true, u8("Количество"), imgui.ImVec2(var_233_164, 0)) then
					img.buy_price_is_ready.v = false

					imgui.OpenPopup("buy_auto_number")
				end

				if imgui.BeginPopup("buy_auto_number") then
					imgui.TextDisabled(u8("Автоматическое распределение количества товара\nна равные части бюджета"))
					imgui.Separator()

					local var_233_165 = sampGetDialogText():gsub("{%x%x%x%x%x%x}", "")
					local var_233_166 = sampIsDialogActive() and var_233_165:find("Добавить товар на покупку", 1, true)

					if imgui.RadioButton(u8("На все деньги, кроме:"), buy_playlist.auto_number_mode == "all") then
						buy_playlist.auto_number_mode = "all"

						ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, "auto_number_mode", buy_playlist.auto_number_mode)
					end

					imgui.PushItemWidth(scale(100, set.scale))
					imgui.SameLine(scale(185, set.scale))

					if imgui.InputIntEx("$##img.auto_number_all", img.auto_number_all, 0) then
						buy_playlist.auto_number_all = img.auto_number_all.v

						ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, "auto_number_all", buy_playlist.auto_number_all)
					end

					imgui.Separator()

					if imgui.RadioButton(u8("На сумму:"), buy_playlist.auto_number_mode == "static") then
						buy_playlist.auto_number_mode = "static"

						ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, "auto_number_mode", buy_playlist.auto_number_mode)
					end

					imgui.SameLine(scale(185, set.scale))

					if imgui.InputIntEx("$##img.auto_number_static", img.auto_number_static, 0) then
						buy_playlist.auto_number_static = img.auto_number_static.v

						ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, "auto_number_static", buy_playlist.auto_number_static)
					end

					imgui.Separator()

					local var_233_167 = true

					for iter_233_12, iter_233_13 in ipairs(buy_playlist) do
						if not auto_number_dict[iter_233_13.name] and iter_233_13.enabled and iter_233_13.auto_number then
							var_233_167 = false

							break
						end
					end

					if not var_233_167 then
						imgui.TextColoredRGB(u8("{FF8800}Потребуется дополнительное сканирование"))

						if not var_233_166 then
							imgui.TextColoredRGB(u8("1. Возьмите лавку\n2. Нажмите клавишу Alt\n3. Выберите пункт Palatka.lua\n4. Эта кнопка станет активной"))
						end
					end

					if imgui.ButtonClickable(var_233_167 or not var_233_167 and var_233_166, u8("Автоматически распределить"), imgui.ImVec2(-0.4, 0)) then
						set.dynamic = false
						auto_number_task = {}

						for iter_233_14, iter_233_15 in ipairs(buy_playlist) do
							if not auto_number_dict[iter_233_15.name] and iter_233_15.enabled and iter_233_15.auto_number then
								table.insert(auto_number_task, {
									name = iter_233_15.name
								})
							end
						end

						if #auto_number_task > 0 then
							img.window_menu.v = false
							auto_number_checking = true

							sampSendDialogResponse(sampGetCurrentDialogId(), 1, 2, "Добавить товар на покупку (поиск по предметам)")
						else
							calculate_number()
							imgui.CloseCurrentPopup("buy_auto_number")
						end
					end

					imgui.EndPopup()
				end

				imgui.SameLine()

				local var_233_168 = sampGetDialogText():gsub("{%x%x%x%x%x%x}", "")
				local var_233_169 = sampIsDialogActive() and var_233_168:find("Добавить товар на покупку", 1, true)
				local var_233_170 = sampIsDialogActive() and var_233_168:find("Название\tСкупаете\tСтоимость", 1, true)
				local var_233_171 = var_233_169 and 1 or var_233_170 and 2

				if imgui.ButtonClickable(var_233_171, u8("Снять товар"), imgui.ImVec2(var_233_164, 0)) then
					EXPORTS.buy_cancel(sampGetCurrentDialogId(), var_233_171)
				end

				imgui.SameLine()

				if imgui.ButtonClickable(var_233_171 and #buy_playlist > 0, u8("Выставить"), imgui.ImVec2(var_233_164, 0)) then
					EXPORTS.buy(sampGetCurrentDialogId(), sampGetDialogText(), true)
				end

				imgui.BeginChild("buy right 2", imgui.ImVec2(0, 0), true, imgui.WindowFlags.NoScrollWithMouse + imgui.WindowFlags.NoScrollbar)

				if img.search_buffer2.v ~= "" then
					if imgui.ButtonRed(img.search_buffer2.v ~= "", u8("Стереть##img.search_buffer2")) then
						buy_do_refresh_right_draw_list = true
						img.search_buffer2.v = ""
					end
				elseif imgui.ButtonClickable(img.search_buffer2.v ~= "", u8("Стереть##img.search_buffer2")) then
					buy_do_refresh_right_draw_list = true
					img.search_buffer2.v = ""
				end

				imgui.SameLineItemInnerSpacing()
				-- SKUP
				local var_233_172 = scale(60, set.scale)
				local var_233_173 = imgui.GetFrameHeight()
				local var_233_174 = ( var_233_0.ItemInnerSpacing.x + var_233_0.ItemSpacing.x ) * 5

				imgui.PushItemWidth(-(var_233_172 + var_233_173 + var_233_174))

				if imgui.InputText("##img.search_buffer2", img.search_buffer2, imgui.InputTextFlags.AutoSelectAll) then
					buy_do_refresh_right_draw_list = true
				end

				imgui.SameLine()

				local var_233_175 = buy_playlist.filter_not_null or buy_playlist.filter_null or buy_playlist.filter_enabled or buy_playlist.filter_not_enabled or buy_playlist.filter_auto_number or buy_playlist.filter_not_auto_number

				if imgui.ButtonRed(var_233_175, u8("Фильтр##скупка"), imgui.ImVec2(var_233_172, 0)) then
					imgui.OpenPopup("buy_filter")
				end

				imgui.SameLineItemInnerSpacing()

				local var_233_176

				if var_233_175 then
					var_233_176 = imgui.ButtonRed(true, fa.ICON_FA_TIMES .. "##filter_sell", imgui.ImVec2(var_233_173, 0))
				else
					var_233_176 = imgui.ButtonClickable(false, fa.ICON_FA_TIMES .. "##filter_sell", imgui.ImVec2(var_233_173, 0))
				end

				if imgui.BeginPopup("buy_filter", imgui.WindowFlags.NoScrollWithMouse) then
					imgui.TextDisabled(u8("ЖОПА"))
					imgui.Separator()

					if imgui.Checkbox(u8("Включенный предмет"), img.buy_playlist.filter_enabled) then
						buy_playlist.filter_enabled = img.buy_playlist.filter_enabled.v
						buy_playlist.filter_not_enabled = false
						img.buy_playlist.filter_not_enabled.v = false

						ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, "filter_not_enabled", buy_playlist.filter_not_enabled)
						ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, "filter_enabled", buy_playlist.filter_enabled)

						buy_do_refresh_right_draw_list = true
					end

					if imgui.Checkbox(u8("Цена указана"), img.buy_playlist.filter_not_null) then
						buy_playlist.filter_not_null = img.buy_playlist.filter_not_null.v
						buy_playlist.filter_null = false
						img.buy_playlist.filter_null.v = false

						ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, "filter_null", buy_playlist.filter_null)
						ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, "filter_not_null", buy_playlist.filter_not_null)

						buy_do_refresh_right_draw_list = true
					end

					if imgui.Checkbox(u8("Количество распределяется автоматически"), img.buy_playlist.filter_auto_number) then
						buy_playlist.filter_auto_number = img.buy_playlist.filter_auto_number.v
						buy_playlist.filter_not_auto_number = false
						img.buy_playlist.filter_not_auto_number.v = false

						ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, "filter_not_auto_number", buy_playlist.filter_not_auto_number)
						ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, "filter_auto_number", buy_playlist.filter_auto_number)

						buy_do_refresh_right_draw_list = true
					end

					imgui.Separator()

					if imgui.Checkbox(u8("Отключенный предмет"), img.buy_playlist.filter_not_enabled) then
						buy_playlist.filter_not_enabled = img.buy_playlist.filter_not_enabled.v
						buy_playlist.filter_enabled = false
						img.buy_playlist.filter_enabled.v = false

						ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, "filter_enabled", buy_playlist.filter_enabled)
						ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, "filter_not_enabled", buy_playlist.filter_not_enabled)

						buy_do_refresh_right_draw_list = true
					end

					if imgui.Checkbox(u8("Цена не указана"), img.buy_playlist.filter_null) then
						buy_playlist.filter_null = img.buy_playlist.filter_null.v
						buy_playlist.filter_not_null = false
						img.buy_playlist.filter_not_null.v = false

						ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, "filter_not_null", buy_playlist.filter_not_null)
						ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, "filter_null", buy_playlist.filter_null)

						buy_do_refresh_right_draw_list = true
					end

					if imgui.Checkbox(u8("Количество распределяется вручную"), img.buy_playlist.filter_not_auto_number) then
						buy_playlist.filter_not_auto_number = img.buy_playlist.filter_not_auto_number.v
						buy_playlist.filter_auto_number = false
						img.buy_playlist.filter_auto_number.v = false

						ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, "filter_auto_number", buy_playlist.filter_auto_number)
						ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, "filter_not_auto_number", buy_playlist.filter_not_auto_number)

						buy_do_refresh_right_draw_list = true
					end

					imgui.Separator()

					var_233_176 = imgui.ButtonClickable(var_233_175, u8("Сбросить фильтр"), imgui.ImVec2(scale(345, set.scale), 0))

					if var_233_176 then
						imgui.CloseCurrentPopup()
					end

					imgui.EndPopup()
				end

				if var_233_176 then
					buy_playlist.filter_enabled = false
					buy_playlist.filter_not_null = false
					buy_playlist.filter_not_enabled = false
					buy_playlist.filter_null = false
					buy_playlist.filter_auto_number = false
					buy_playlist.filter_not_auto_number = false
					img.buy_playlist.filter_enabled.v = false
					img.buy_playlist.filter_not_null.v = false
					img.buy_playlist.filter_not_enabled.v = false
					img.buy_playlist.filter_null.v = false
					img.buy_playlist.filter_auto_number.v = false
					img.buy_playlist.filter_not_auto_number.v = false

					ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, "filter_not_enabled", buy_playlist.filter_not_enabled)
					ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, "filter_enabled", buy_playlist.filter_enabled)
					ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, "filter_null", buy_playlist.filter_null)
					ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, "filter_not_null", buy_playlist.filter_not_null)
					ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, "filter_auto_number", buy_playlist.filter_auto_number)
					ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, "filter_not_auto_number", buy_playlist.filter_not_auto_number)

					buy_do_refresh_right_draw_list = true
				end

				local var_233_177 = 0

				imgui.BeginChild("buy right 3" .. (img.search_buffer2.v ~= "" and "+" or ""), imgui.ImVec2(0, -imgui.GetFrameHeight() * 2 - var_233_0.ItemSpacing.x), false, imgui.WindowFlags.AlwaysUseWindowPadding + ((set.scroller or set.scroller_smooth or imgui.IsMouseDown(0)) and imgui.WindowFlags.NoScrollWithMouse or 0))

				local var_233_178 = imgui.GetFrameHeight() * 2 + imgui.GetFontSize()
				local var_233_179 = var_233_0.ItemSpacing.y * 4

				if set.scroller or set.scroller_smooth then
					imgui.Scroller("ПлейлистСкупки", var_233_178 + var_233_179, set.scroller_smooth and set.scroller_duration or 0)
				end

				if buy_right_scroll == "up" then
					buy_right_scroll = nil

					imgui.SetScrollHere()
				end

				item_filter_index = 0

				if buy_do_refresh_right_draw_list then
					buy_right_draw_list = {}
				end

				for iter_233_16, iter_233_17 in ipairs(buy_playlist) do
					if iter_233_17.enabled then
						if set.dynamic then
							var_233_177 = var_233_177 + iter_233_17.number_dynamic * iter_233_17.price
						else
							var_233_177 = var_233_177 + iter_233_17.number * iter_233_17.price
						end
					end

					if buy_do_refresh_right_draw_list and ru.lower(iter_233_17.name):find(ru.lower(u8:decode(img.search_buffer2.v)), 1, true) and buy_filter(iter_233_17) then
						table.insert(buy_right_draw_list, {
							index = iter_233_16,
							item = iter_233_17
						})
					end
				end

				buy_do_refresh_right_draw_list = false

				local var_233_180 = imgui.ImGuiListClipper(#buy_right_draw_list)

				while var_233_180:Step() do
					for iter_233_18 = var_233_180.DisplayStart + 1, var_233_180.DisplayEnd do
						local var_233_181 = buy_right_draw_list[iter_233_18].index
						local var_233_182 = buy_right_draw_list[iter_233_18].item

						if img.buy_playlist[var_233_181] then
							item_filter_index = item_filter_index + 1
							ImgItem = img.buy_playlist[var_233_181]

							local var_233_183 = not var_233_182.enabled or var_233_182.price < 10 or not ((set.dynamic and var_233_182.number_dynamic or var_233_182.number) > 0)

							if var_233_183 then
								imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
							end

							imgui.Link(var_233_181 .. " - " .. ImgItem.name .. " | " .. sep((set.dynamic and var_233_182.number_dynamic or var_233_182.number) * var_233_182.price) .. " " .. buy_playlist.price_value)

							if imgui.IsItemHovered() and imgui.IsMouseDown(0) then
								tmp.average_title = "buy/average"
								tmp.popup_average = {
									index = var_233_181,
									ImgItem = ImgItem,
									item = var_233_182
								}
							end

							if imgui.IsItemHovered() and imgui.IsMouseDown(0) then
								imgui.BeginTooltip()
								imgui_average()
								imgui.EndTooltip()
							end

							if imgui.Checkbox("##ImgItem.enabled " .. var_233_181, ImgItem.enabled) then
								var_233_182.enabled = ImgItem.enabled.v
								buy_do_refresh_right_draw_list = true

								ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, var_233_181, var_233_182)
							end

							imgui.SameLineItemInnerSpacing()

							local var_233_184 = "##buy_current_moving_item " .. var_233_181

							if buy_current_moving_item then
								if imgui.RadioButton(var_233_184, buy_current_moving_item == var_233_181) then
									if not help.moving_item then
										help.moving_item = 1
									else
										help.moving_item = help.moving_item + 1
									end

									ecfg.save(filename_help, help)
									buy_move_item(buy_current_moving_item, var_233_181)

									buy_current_moving_item = nil
								end
							elseif imgui.RadioButton(var_233_184, buy_current_moving_item == var_233_181) then
								buy_current_moving_item = var_233_181

								if not help.moving_item then
									help.moving_item = 1
								else
									help.moving_item = help.moving_item + 1
								end

								ecfg.save(filename_help, help)
							end

							imgui.SameLineItemInnerSpacing()

							if imgui.ButtonCheckbox(not var_233_182.auto_number, var_233_182.auto_number and u8("А##") .. var_233_181 or u8("Р##") .. var_233_181, imgui.ImVec2(imgui.GetFrameHeight(), imgui.GetFrameHeight())) then
								var_233_182.auto_number = not var_233_182.auto_number

								if not help["item.auto_number"] then
									help["item.auto_number"] = 1
								else
									help["item.auto_number"] = help["item.auto_number"] + 1
								end

								buy_do_refresh_right_draw_list = true

								ecfg.save(filename_help, help)
								ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, var_233_181, var_233_182)
							end

							if (not help["item.auto_number"] or help["item.auto_number"] and help["item.auto_number"] < 3) and imgui.IsItemHovered() then
								imgui.SetTooltip(u8("[ А ] - Автоматическое количество\n\n[ Р ] - Ручное количество"))
							end

							local var_233_185 = imgui.CalcTextSize(u8("Продолжить")).x + var_233_0.ItemSpacing.x * 3

							imgui.SameLine(var_233_185)
							imgui.PushItemWidth(scale(60, set.scale))

							if set.dynamic then
								imgui.PushStyleVar(imgui.StyleVar.ButtonTextAlign, imgui.ImVec2(0, 0.5))
								imgui.ButtonClickable(false, ImgItem.number.v .. "##ImgItem.number " .. var_233_181, imgui.ImVec2(scale(60, set.scale), 0))
								imgui.PopStyleVar()
								imgui.SameLineItemInnerSpacing()
								imgui.TextDisabled(u8("шт"))
							elseif imgui.InputIntEx(u8("шт##ImgItem.number ") .. var_233_181, ImgItem.number, 0) then
								if ImgItem.number.v >= 0 then
									var_233_182.number = ImgItem.number.v
									buy_do_refresh_right_draw_list = true
								else
									ImgItem.number.v = 0
									var_233_182.number = ImgItem.number.v
									buy_do_refresh_right_draw_list = true
								end

								ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, var_233_181, var_233_182)
							end

							imgui.SameLine()

							local var_233_186 = imgui.GetCursorPos().x + scale(81, set.scale) + var_233_0.ItemInnerSpacing.x

							imgui.PushItemWidth(scale(92, set.scale))

							if buy_sum_edit ~= var_233_181 then
								imgui.PushStyleVar(imgui.StyleVar.ButtonTextAlign, imgui.ImVec2(0, 0.5))

								if imgui.Button(sep(ImgItem.price.v) .. "##ImgItem.price " .. var_233_181, imgui.ImVec2(scale(92, set.scale), 0)) then
									buy_sum_edit = var_233_181
									buy_sum_focus = true
								end

								imgui.PopStyleVar()
								imgui.SameLineItemInnerSpacing()
								imgui.Text(buy_playlist.price_value)
							else
								if buy_sum_focus then
									buy_sum_focus = false

									imgui.SetKeyboardFocusHere()
								end

								if imgui.InputIntEx(buy_playlist.price_value .. u8("##ImgItem.price ") .. var_233_181, ImgItem.price, 0) then
									if ImgItem.price.v >= 10 and ImgItem.price.v <= 2000000000 then
										var_233_182.price = ImgItem.price.v

										ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, var_233_181, var_233_182)
									elseif ImgItem.price.v > 2000000000 or ImgItem.price.v < 0 then
										ImgItem.price.v = 2000000000
										var_233_182.price = ImgItem.price.v

										ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, var_233_181, var_233_182)
									elseif ImgItem.price.v < 10 then
										ImgItem.price.v = 10
										var_233_182.price = ImgItem.price.v

										ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, var_233_181, var_233_182)
									end

									buy_dplaylist[var_233_182.name] = var_233_182.price
									buy_sum_edit = nil
								end
							end

							if set.dynamic then
								imgui.Text(u8("Продолжить"))
							else
								imgui.TextDisabled(u8("Продолжить"))
							end

							imgui.SameLine(var_233_185)
							imgui.PushItemWidth(scale(60, set.scale))

							if not set.dynamic then
								imgui.PushStyleVar(imgui.StyleVar.ButtonTextAlign, imgui.ImVec2(0, 0.5))
								imgui.ButtonClickable(false, ImgItem.number_dynamic.v .. "##ImgItem.number_dynamic " .. var_233_181, imgui.ImVec2(scale(60, set.scale), 0))
								imgui.PopStyleVar()
								imgui.SameLineItemInnerSpacing()
								imgui.TextDisabled(u8("шт"))
							elseif imgui.InputIntEx(u8("шт##ImgItem.number_dynamic ") .. var_233_181, ImgItem.number_dynamic, 0) then
								if ImgItem.number_dynamic.v >= 0 then
									var_233_182.number_dynamic = ImgItem.number_dynamic.v
									buy_do_refresh_right_draw_list = true
								else
									ImgItem.number_dynamic.v = 0
									var_233_182.number_dynamic = ImgItem.number_dynamic.v
									buy_do_refresh_right_draw_list = true
								end

								ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, var_233_181, var_233_182)
							end

							imgui.SameLine()
							imgui.PushItemWidth(scale(30, set.scale))

							if imgui.InputIntEx(u8("Уровень##") .. var_233_181, ImgItem.lvl, 0) then
								if ImgItem.lvl.v < 1 then
									ImgItem.lvl.v = 1
								else
									var_233_182.lvl = ImgItem.lvl.v

									ecfg.table_set(directory_buy .. "\\" .. set.current_playlist, var_233_181, var_233_182)
								end
							end

							imgui.SameLine(var_233_186)

							if imgui.Button(fa.ICON_FA_TIMES .. "##ImgItem.name " .. var_233_181, imgui.ImVec2(imgui.GetFrameHeight(), 0)) then
								table.remove(buy_playlist, var_233_181)

								buy_dplaylist[var_233_182.name] = nil

								table.remove(img.buy_playlist, var_233_181)

								if buy_current_moving_item and buy_current_moving_item == var_233_181 then
									buy_current_moving_item = nil
								elseif buy_current_moving_item and var_233_181 < buy_current_moving_item then
									buy_current_moving_item = buy_current_moving_item - 1
								end

								ecfg.table_remove(directory_buy .. "\\" .. set.current_playlist, var_233_181)

								buy_do_refresh_right_draw_list = true
							end

							if var_233_183 then
								imgui.PopStyleColor()
							end

							imgui.Separator()
						end
					end
				end

				if buy_right_scroll == "down" then
					buy_right_scroll = nil

					imgui.SetScrollHere()
				end

				imgui.EndChild()

				local var_233_187 = getPlayerMoney(PLAYER_HANDLE)

				imgui.TextColoredRGB("{888888}" .. sep(var_233_187) .. " " .. buy_playlist.price_value .. " - {008800}" .. sep(var_233_177) .. " " .. buy_playlist.price_value .. " " .. "{888888}=")

				if var_233_177 <= var_233_187 then
					imgui.TextColoredRGB("{888888}" .. sep(var_233_187 - var_233_177) .. " " .. buy_playlist.price_value .. " " .. u8("(Остается на руках)"))
				else
					imgui.TextColoredRGB("{FF8800}" .. sep(var_233_187 - var_233_177) .. " " .. buy_playlist.price_value .. " " .. u8("(Остается на руках)"))
				end

				imgui.EndChild()
				imgui.EndChild()
			end
		end

		if set.current_tab == "sell" and not tmp.popup_tab then
			local var_233_188 = set.small and 1 or 2.1
			local var_233_189 = var_233_0.ItemSpacing.x * (var_233_188 - 1)
			local var_233_190 = imgui.GetWindowContentRegionMax().x - var_233_189
			local var_233_191 = var_233_190 / var_233_188
			local var_233_192 = var_233_190 - var_233_191

			if set.small_state == "left" or not set.small then
				imgui.BeginChild("sell left", imgui.ImVec2(var_233_191, 0), false, imgui.WindowFlags.NoScrollWithMouse + imgui.WindowFlags.NoScrollbar)

				local var_233_193 = sampGetDialogText():gsub("{%x%x%x%x%x%x}", "")

				if sampIsDialogActive() then
					local var_233_194 = var_233_193:find("1. Выставить товар на продажу", 1, true)
				end

				if sampIsDialogActive() then
					local var_233_195 = var_233_193:find("Название\tВ наличии\tВ продаже\tСтоимость", 1, true)
				end

				local var_233_196 = true

				if sampIsDialogActive() then
					local var_233_197 = var_233_193:find("Средние цены товаров при продаже", 1, true)
				end

				if imgui.BeginPopup("sell_average_popup") then
					imgui.EndPopup()
				end

				if imgui.ButtonClickable(true, u8("Обновить"), imgui.ImVec2(set.small and -(100 + var_233_0.ItemSpacing.x) or -0.4, 0)) then
					EXPORTS.sell_refresh()

					sell_current_moving_item = nil
					buy_current_moving_item = nil
					set.current_tab = "sell"
					tmp.popup_tab = nil

					ecfg.save(filename_set, set)

					sell_do_refresh_right_draw_list = true
					sell_do_refresh_left_draw_list = true
				end

				if set.small then
					imgui.SameLine()

					if imgui.Button(fa.ICON_FA_LONG_ARROW_ALT_RIGHT, imgui.ImVec2(100, 0)) then
						set.small_state = "right"

						ecfg.save(filename_set, set)
					end
				end

				if imgui.Checkbox(u8("Добавлять наверх"), img.to_start) then
					set.to_start = img.to_start.v

					ecfg.save(filename_set, set)
				end

				imgui.BeginChild("sell left 2", imgui.ImVec2(0, 0), true, imgui.WindowFlags.NoScrollWithMouse + imgui.WindowFlags.NoScrollbar)

				if img.search_buffer.v ~= "" then
					if imgui.ButtonRed(img.search_buffer.v ~= "", u8("Стереть##img.search_buffer")) then
						img.search_buffer.v = ""
						sell_do_refresh_left_draw_list = true
					end
				elseif imgui.ButtonClickable(img.search_buffer.v ~= "", u8("Стереть##img.search_buffer")) then
					img.search_buffer.v = ""
					sell_do_refresh_left_draw_list = true
				end

				imgui.SameLineItemInnerSpacing()
				imgui.PushItemWidth(-0.4)

				if imgui.InputText("##img.search_buffer", img.search_buffer, imgui.InputTextFlags.AutoSelectAll) then
					sell_do_refresh_left_draw_list = true
				end

				imgui.BeginChild("sell left 3" .. (img.search_buffer.v ~= "" and "+" or ""), imgui.ImVec2(0, 0), false, imgui.WindowFlags.AlwaysUseWindowPadding + ((set.scroller or set.scroller_smooth) and imgui.WindowFlags.NoScrollWithMouse or 0))

				if set.scroller or set.scroller_smooth then
					local var_233_198 = imgui.GetFontSize() * 2 + var_233_0.ItemSpacing.y

					imgui.Scroller("левая продажа", var_233_198, set.scroller_smooth and set.scroller_duration or 0)
				end

				if sell_do_refresh_left_draw_list then
					sell_do_refresh_left_draw_list = false
					sell_left_draw_list = {}

					for iter_233_19, iter_233_20 in ipairs(sell_list) do
						local var_233_199 = iter_233_20:gsub("%(%+%d+%)", "")
						local var_233_200
						local var_233_201 = not set.sell_delete or #buy_list == 0 and true or not not buy_dlist[var_233_199] and true

						if ru.lower(iter_233_20):find(ru.lower(u8:decode(img.search_buffer.v)), 1, true) and var_233_201 then
							table.insert(sell_left_draw_list, iter_233_20)
						end
					end
				end

				local var_233_202 = imgui.ImGuiListClipper(#sell_left_draw_list)

				while var_233_202:Step() do
					for iter_233_21 = var_233_202.DisplayStart + 1, var_233_202.DisplayEnd do
						local var_233_203 = sell_left_draw_list[iter_233_21]

						if not sell_dplaylist[var_233_203] then
							if imgui.Selectable(u8(var_233_203) .. "\n" .. (sell_number_dict[var_233_203] or " - ") .. u8(" шт")) then
								sell_add_item(var_233_203)

								if set.to_start then
									sell_right_scroll = "up"
								else
									sell_right_scroll = "down"
								end
							end
						else
							imgui.TextDisabled(u8(var_233_203) .. "\n" .. (sell_number_dict[var_233_203] or " - ") .. u8(" шт"))
						end
					end
				end

				imgui.EndChild()
				imgui.EndChild()
				imgui.EndChild()
				imgui.SameLine()
			end

			if set.small_state == "right" or not set.small then
				imgui.BeginChild("sell right", imgui.ImVec2(var_233_192, 0), false, imgui.WindowFlags.NoScrollWithMouse + imgui.WindowFlags.NoScrollbar)

				local var_233_204 = sell_playlist.price_value == "$" and set.sell_komm or sell_playlist.price_value == "VC$" and set.sell_komm_vc

				if set.small then
					if imgui.Button(fa.ICON_FA_LONG_ARROW_ALT_LEFT, imgui.ImVec2(100, 0)) then
						set.small_state = "left"

						ecfg.save(filename_set, set)
					end

					imgui.SameLine()
				end

				if imgui.Button(u8(set.current_playlist):gsub("%.[^.]+$", "") .. u8("  |  ") .. sell_playlist.price_value .. "##playlist", imgui.ImVec2(-0.4, 0)) then
					sell_current_moving_item = nil
					buy_current_moving_item = nil

					refresh_playlists()

					tmp.popup_tab = "sell/playlists"
				end

				local var_233_205 = set.small and 4 or 3
				--local var_233_206 = (imgui.GetWindowWidth() - var_233_0.ItemSpacing.x * (var_233_205 - 1)) / var_233_205
				local var_233_206 = (imgui.GetWindowWidth() - var_233_0.ItemSpacing.x * (var_233_205 - 1)) / 4
				local var_233_207 = sampGetDialogText():gsub("{%x%x%x%x%x%x}", "")
				local var_233_208 = sampIsDialogActive() and (var_233_207:find("Управление продажей товаров", 1, true) or var_233_207:find("[1] Управление продажей товаров", 1, true))
				local var_233_209 = sampIsDialogActive() and var_233_207:find("Название\tВ наличии\tВ продаже\tСтоимость", 1, true)
				local var_233_210 = var_233_208 and 1 or var_233_209 and 2

				if imgui.ButtonRed(set.dynamic, u8("Продолжить"), imgui.ImVec2(var_233_206, 0)) then
					set.dynamic = not set.dynamic

					if not help["set.dynamic"] then
						help["set.dynamic"] = 1
					else
						help["set.dynamic"] = help["set.dynamic"] + 1
					end

					buy_do_refresh_right_draw_list = true
					sell_do_refresh_right_draw_list = true

					ecfg.save(filename_help, help)
					ecfg.save(filename_set, set)
				end

				if (not help["set.dynamic"] or help["set.dynamic"] and help["set.dynamic"] < 3) and imgui.IsItemHovered() then
					imgui.SetTooltip(u8("Включите эту функцию после потери лавки,\nчтобы продолжить продажу в запланированном количестве.\n\nПосле включения нажмите кнопку \"Выставить\"."))
				end

				if set.small then
					imgui.SameLine()

					if imgui.ButtonClickable(true, u8("Обновить"), imgui.ImVec2(var_233_206, 0)) then
						EXPORTS.sell_refresh()

						sell_current_moving_item = nil
						buy_current_moving_item = nil
						set.current_tab = "sell"
						tmp.popup_tab = nil

						ecfg.save(filename_set, set)

						sell_do_refresh_right_draw_list = true
						sell_do_refresh_left_draw_list = true
					end
				end

				imgui.SameLine()

				if imgui.ButtonClickable(false, u8("Снять товар"), imgui.ImVec2(var_233_206, 0)) then
					EXPORTS.sell_cancel(sampGetCurrentDialogId(), var_233_210)
				end

				if imgui.IsItemHovered() then
					imgui.SetTooltip(u8("Снятие товара пока не работает, ожидайте новостей в канале обновлений скрипта!"))
				end

				imgui.SameLine()

				if imgui.ButtonClickable(var_233_210 and next(sell_number_dict) and #sell_playlist > 0, u8("Выставить"), imgui.ImVec2(var_233_206, 0)) then
					if not set.default_invent then
						imgui.OpenPopup("default_invent")
					else
						EXPORTS.sell_with_refresh()
					end
				end

				if imgui.BeginPopup("default_invent") then
					imgui.Text(u8("Для работы этой функции необходимо\nсбросить настройки инвентаря!\n\n - /settings\n - Настройки инвентаря\n - Cбросить настройки инвентаря\n\nЭто действие может изменить\nположение или размер инвентаря."))

					if imgui.Button(u8("Сбросить"), imgui.ImVec2(-0.4, scale(40, set.scale))) then
						sbros_inv = true

						sampSendChat("/settings")

						img.window_menu.v = false
					end

					imgui.EndPopup()
				end

				imgui.BeginChild("sell right 2", imgui.ImVec2(0, 0), true, imgui.WindowFlags.NoScrollWithMouse + imgui.WindowFlags.NoScrollbar)

				if img.search_buffer2.v ~= "" then
					if imgui.ButtonRed(img.search_buffer2.v ~= "", u8("Стереть##img.search_buffer2")) then
						img.search_buffer2.v = ""
						sell_do_refresh_right_draw_list = true
					end
				elseif imgui.ButtonClickable(img.search_buffer2.v ~= "", u8("Стереть##img.search_buffer2")) then
					img.search_buffer2.v = ""
					sell_do_refresh_right_draw_list = true
				end

				imgui.SameLineItemInnerSpacing()

				local var_233_211 = scale(60, set.scale)
				local var_233_212 = imgui.GetFrameHeight()
				local var_233_213 = (var_233_0.ItemInnerSpacing.x + var_233_0.ItemSpacing.x ) * 5

				imgui.PushItemWidth(-(var_233_211 + var_233_212 + var_233_213))

				if imgui.InputText("##img.search_buffer2", img.search_buffer2, imgui.InputTextFlags.AutoSelectAll) then
					sell_do_refresh_right_draw_list = true
				end

				imgui.SameLine()

				local var_233_214 = sell_playlist.filter_not_empty or sell_playlist.filter_empty or sell_playlist.filter_enabled or sell_playlist.filter_not_enabled or sell_playlist.filter_null or sell_playlist.filter_not_null

				if imgui.ButtonRed(var_233_214, u8("Фильтр##продажа"), imgui.ImVec2(var_233_211, 0)) then
					imgui.OpenPopup("sell_filter")
				end

				imgui.SameLineItemInnerSpacing()

				local var_233_215

				if var_233_214 then
					var_233_215 = imgui.ButtonRed(true, fa.ICON_FA_TIMES .. "##filter_sell", imgui.ImVec2(var_233_212, 0))
				else
					var_233_215 = imgui.ButtonClickable(false, fa.ICON_FA_TIMES .. "##filter_sell", imgui.ImVec2(var_233_212, 0))
				end

				if imgui.BeginPopup("sell_filter") then
					if imgui.Checkbox(u8("Включенный предмет"), img.sell_playlist.filter_enabled) then
						sell_playlist.filter_enabled = img.sell_playlist.filter_enabled.v
						sell_playlist.filter_not_enabled = false
						img.sell_playlist.filter_not_enabled.v = false

						ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, "filter_not_enabled", sell_playlist.filter_not_enabled)
						ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, "filter_enabled", sell_playlist.filter_enabled)

						sell_do_refresh_right_draw_list = true
					end

					if imgui.Checkbox(u8("Цена указана"), img.sell_playlist.filter_not_null) then
						sell_playlist.filter_not_null = img.sell_playlist.filter_not_null.v
						sell_playlist.filter_null = false
						img.sell_playlist.filter_null.v = sell_playlist.filter_null

						ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, "filter_null", sell_playlist.filter_null)
						ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, "filter_not_null", sell_playlist.filter_not_null)

						sell_do_refresh_right_draw_list = true
					end

					if imgui.Checkbox(u8("Есть в наличии"), img.sell_playlist.filter_not_empty) then
						sell_playlist.filter_not_empty = img.sell_playlist.filter_not_empty.v
						sell_playlist.filter_empty = false
						img.sell_playlist.filter_empty.v = false

						ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, "filter_empty", sell_playlist.filter_empty)
						ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, "filter_not_empty", sell_playlist.filter_not_empty)

						sell_do_refresh_right_draw_list = true
					end

					imgui.Separator()

					if imgui.Checkbox(u8("Отключенный предмет"), img.sell_playlist.filter_not_enabled) then
						sell_playlist.filter_not_enabled = img.sell_playlist.filter_not_enabled.v
						sell_playlist.filter_enabled = false
						img.sell_playlist.filter_enabled.v = false

						ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, "filter_enabled", sell_playlist.filter_enabled)
						ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, "filter_not_enabled", sell_playlist.filter_not_enabled)

						sell_do_refresh_right_draw_list = true
					end

					if imgui.Checkbox(u8("Цена не указана"), img.sell_playlist.filter_null) then
						sell_playlist.filter_null = img.sell_playlist.filter_null.v
						sell_playlist.filter_not_null = false
						img.sell_playlist.filter_not_null.v = sell_playlist.filter_not_null

						ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, "filter_not_null", sell_playlist.filter_not_null)
						ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, "filter_null", sell_playlist.filter_null)

						sell_do_refresh_right_draw_list = true
					end

					if imgui.Checkbox(u8("Нет в наличии"), img.sell_playlist.filter_empty) then
						sell_playlist.filter_empty = img.sell_playlist.filter_empty.v
						sell_playlist.filter_not_empty = false
						img.sell_playlist.filter_not_empty.v = false

						ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, "filter_not_empty", sell_playlist.filter_not_empty)
						ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, "filter_empty", sell_playlist.filter_empty)

						sell_do_refresh_right_draw_list = true
					end

					imgui.Separator()

					var_233_215 = imgui.ButtonClickable(var_233_214, u8("Сбросить фильтр"), imgui.ImVec2(scale(220, set.scale), 0))

					if var_233_215 then
						imgui.CloseCurrentPopup()
					end

					imgui.EndPopup()
				end

				if var_233_215 then
					sell_playlist.filter_enabled = false
					sell_playlist.filter_not_empty = false
					sell_playlist.filter_not_enabled = false
					sell_playlist.filter_empty = false
					sell_playlist.filter_null = false
					sell_playlist.filter_not_null = false
					img.sell_playlist.filter_enabled.v = false
					img.sell_playlist.filter_not_empty.v = false
					img.sell_playlist.filter_not_enabled.v = false
					img.sell_playlist.filter_empty.v = false
					img.sell_playlist.filter_null.v = false
					img.sell_playlist.filter_not_null.v = false

					ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, "filter_not_enabled", sell_playlist.filter_not_enabled)
					ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, "filter_enabled", sell_playlist.filter_enabled)
					ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, "filter_empty", sell_playlist.filter_empty)
					ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, "filter_not_empty", sell_playlist.filter_not_empty)
					ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, "filter_null", sell_playlist.filter_null)
					ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, "filter_not_null", sell_playlist.filter_not_null)

					sell_do_refresh_right_draw_list = true
				end

				local var_233_216 = 0

				imgui.BeginChild("sell right 3" .. (img.search_buffer2.v ~= "" and "+" or ""), imgui.ImVec2(0, -imgui.GetFrameHeight() * 2 - var_233_0.ItemSpacing.x), false, imgui.WindowFlags.AlwaysUseWindowPadding + ((set.scroller or set.scroller_smooth or imgui.IsMouseDown(0)) and imgui.WindowFlags.NoScrollWithMouse or 0))

				if set.scroller or set.scroller_smooth then
					local var_233_217 = imgui.GetFrameHeight() * 2 + imgui.GetFontSize()
					local var_233_218 = var_233_0.ItemSpacing.y * 4

					imgui.Scroller("ПлейлистПродажи", var_233_217 + var_233_218, set.scroller_smooth and set.scroller_duration or 0)
				end

				if sell_right_scroll == "up" then
					sell_right_scroll = nil

					imgui.SetScrollHere()
				end

				local var_233_219 = 0

				if sell_do_refresh_right_draw_list then
					sell_right_draw_list = {}
				end

				for iter_233_22, iter_233_23 in ipairs(sell_playlist) do
					if iter_233_23.enabled then
						local var_233_220

						if set.dynamic then
							var_233_220 = math.min(iter_233_23.number_dynamic, sell_number_dict[iter_233_23.name] or 0)
						elseif iter_233_23.maximum then
							var_233_220 = sell_number_dict[iter_233_23.name] or 0
						else
							var_233_220 = math.min(iter_233_23.number, sell_number_dict[iter_233_23.name] or 0)
						end

						var_233_216 = var_233_216 + var_233_220 * iter_233_23.price
					end

					if sell_do_refresh_right_draw_list and ru.lower(iter_233_23.name):find(ru.lower(u8:decode(img.search_buffer2.v)), 1, true) and sell_filter(iter_233_23) then
						table.insert(sell_right_draw_list, {
							index = iter_233_22,
							item = iter_233_23
						})
					end
				end

				sell_do_refresh_right_draw_list = false

				local var_233_221 = imgui.ImGuiListClipper(#sell_right_draw_list)

				while var_233_221:Step() do
					for iter_233_24 = var_233_221.DisplayStart + 1, var_233_221.DisplayEnd do
						local var_233_222 = sell_right_draw_list[iter_233_24].index
						local var_233_223 = sell_right_draw_list[iter_233_24].item

						if sell_playlist[var_233_222] then
							var_233_219 = var_233_219 + 1
							ImgItem = img.sell_playlist[var_233_222]

							local var_233_224 = not var_233_223.enabled or var_233_223.price < 10 or not sell_number_dict[var_233_223.name] or sell_number_dict[var_233_223.name] and sell_number_dict[var_233_223.name] < 1 or set.dynamic and var_233_223.number_dynamic < 1 or not set.dynamic and var_233_223.number < 1 and not var_233_223.maximum

							if var_233_224 then
								imgui.PushStyleColor(imgui.Col.Text, imgui.GetStyle().Colors[imgui.Col.TextDisabled])
							end

							local var_233_225

							if set.dynamic then
								var_233_225 = var_233_223.number_dynamic
							elseif var_233_223.maximum then
								var_233_225 = sell_number_dict[var_233_223.name] or 0
							else
								var_233_225 = var_233_223.number
							end

							local var_233_226 = math.floor(var_233_225 * var_233_223.price * (1 - var_233_204 / 100))

							imgui.Link(var_233_222 .. " - " .. ImgItem.name .. " | " .. sep(var_233_226) .. " " .. sell_playlist.price_value .. " (" .. 100 - var_233_204 .. "%)")

							if imgui.IsItemHovered() and imgui.IsMouseDown(0) then
								tmp.average_title = "sell/average"
								tmp.popup_average = {
									index = var_233_222,
									ImgItem = ImgItem,
									item = var_233_223
								}
							end

							if imgui.IsItemHovered() and imgui.IsMouseDown(0) then
								imgui.BeginTooltip()
								imgui_average()
								imgui.EndTooltip()
							end

							if imgui.Checkbox("##ImgItem.enabled " .. var_233_222, ImgItem.enabled) then
								var_233_223.enabled = ImgItem.enabled.v

								ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, var_233_222, var_233_223)

								sell_do_refresh_right_draw_list = true
							end

							imgui.SameLineItemInnerSpacing()

							local var_233_227 = "##sell_current_moving_item " .. var_233_222

							if sell_current_moving_item then
								if imgui.RadioButton(var_233_227, sell_current_moving_item == var_233_222) then
									if not help.moving_item then
										help.moving_item = 1
									else
										help.moving_item = help.moving_item + 1
									end

									ecfg.save(filename_help, help)
									sell_move_item(sell_current_moving_item, var_233_222)

									sell_current_moving_item = nil
								end
							elseif imgui.RadioButton(var_233_227, sell_current_moving_item == var_233_222) then
								sell_current_moving_item = var_233_222

								if not help.moving_item then
									help.moving_item = 1
								else
									help.moving_item = help.moving_item + 1
								end

								ecfg.save(filename_help, help)
							end

							imgui.PushItemWidth(scale(60, set.scale))

							local var_233_228 = imgui.CalcTextSize(u8("Продолжить")).x + var_233_0.ItemSpacing.x * 2 - imgui.GetFrameHeight() - var_233_0.ItemInnerSpacing.x

							imgui.SameLine(var_233_228)

							if var_233_223.maximum then
								imgui.PushStyleVar(imgui.StyleVar.ButtonTextAlign, imgui.ImVec2(0, 0.5))

								if imgui.ButtonClickable(not set.dynamic, u8("Максимум##") .. var_233_222, imgui.ImVec2(scale(60, set.scale) + imgui.GetFrameHeight() + var_233_0.ItemInnerSpacing.x, 0)) then
									var_233_223.maximum = false

									ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, var_233_222, var_233_223)

									sell_number_focus = var_233_222
									sell_do_refresh_right_draw_list = true
								end

								imgui.PopStyleVar()
								imgui.SameLineItemInnerSpacing()

								if not set.dynamic then
									imgui.Text(u8("шт"))
								else
									imgui.TextDisabled(u8("шт"))
								end
							else
								if not var_233_223.maximum and imgui.ButtonClickable(not set.dynamic, "M##" .. var_233_222, imgui.ImVec2(imgui.GetFrameHeight(), 0)) then
									var_233_223.maximum = not var_233_223.maximum
									sell_do_refresh_right_draw_list = true

									ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, var_233_222, var_233_223)
								end

								imgui.SameLineItemInnerSpacing()

								if sell_number_focus == var_233_222 then
									sell_number_focus = false

									imgui.SetKeyboardFocusHere()
								end

								if set.dynamic then
									imgui.PushStyleVar(imgui.StyleVar.ButtonTextAlign, imgui.ImVec2(0, 0.5))
									imgui.ButtonClickable(false, ImgItem.number.v .. "##ImgItem.number " .. var_233_222, imgui.ImVec2(scale(60, set.scale), 0))
									imgui.PopStyleVar()
									imgui.SameLineItemInnerSpacing()
									imgui.TextDisabled(u8("шт"))
								elseif imgui.InputIntEx(u8("шт##ImgItem.number ") .. var_233_222, ImgItem.number, 0) then
									if ImgItem.number.v >= 0 then
										var_233_223.number = ImgItem.number.v
										sell_do_refresh_right_draw_list = true

										ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, var_233_222, var_233_223)
									else
										ImgItem.number.v = 0
										var_233_223.number = ImgItem.number.v
										sell_do_refresh_right_draw_list = true

										ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, var_233_222, var_233_223)
									end
								end
							end

							imgui.SameLine()

							local var_233_229 = imgui.GetCursorPos().x + scale(81, set.scale) + var_233_0.ItemInnerSpacing.x

							imgui.PushItemWidth(scale(92, set.scale))

							if sell_sum_edit ~= var_233_222 then
								imgui.PushStyleVar(imgui.StyleVar.ButtonTextAlign, imgui.ImVec2(0, 0.5))

								if imgui.Button(sep(ImgItem.price.v) .. "##ImgItem.price " .. var_233_222, imgui.ImVec2(scale(92, set.scale), 0)) then
									sell_sum_edit = var_233_222
									sell_sum_focus = true
								end

								if imgui.IsItemHovered() then
									local var_233_230 = math.floor(ImgItem.price.v * (1 - var_233_204 / 100))

									imgui.SetTooltip(sep(var_233_230) .. " " .. sell_playlist.price_value .. " (" .. 100 - var_233_204 .. "%)")
								end

								imgui.PopStyleVar()
								imgui.SameLineItemInnerSpacing()
								imgui.Text(sell_playlist.price_value)
							else
								if sell_sum_focus then
									sell_sum_focus = false

									imgui.SetKeyboardFocusHere()
								end

								if imgui.InputIntEx(sell_playlist.price_value .. u8("##ImgItem.price ") .. var_233_222, ImgItem.price, 0) then
									if ImgItem.price.v >= 10 and ImgItem.price.v <= 2000000000 then
										var_233_223.price = ImgItem.price.v

										ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, var_233_222, var_233_223)
									elseif ImgItem.price.v > 2000000000 or ImgItem.price.v < 0 then
										ImgItem.price.v = 2000000000
										var_233_223.price = ImgItem.price.v

										ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, var_233_222, var_233_223)
									elseif ImgItem.price.v < 10 then
										ImgItem.price.v = 10
										var_233_223.price = ImgItem.price.v

										ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, var_233_222, var_233_223)
									end

									sell_sum_edit = nil
									sell_dplaylist[var_233_223.name] = var_233_223.price
								end
							end

							if set.dynamic then
								imgui.Text(u8("Продолжить"))
							else
								imgui.TextDisabled(u8("Продолжить"))
							end

							imgui.SameLine(var_233_228 + imgui.GetFrameHeight() + var_233_0.ItemInnerSpacing.x)
							imgui.PushItemWidth(scale(60, set.scale))

							if not set.dynamic then
								imgui.PushStyleVar(imgui.StyleVar.ButtonTextAlign, imgui.ImVec2(0, 0.5))
								imgui.ButtonClickable(false, ImgItem.number_dynamic.v .. "##ImgItem.number_dynamic " .. var_233_222, imgui.ImVec2(scale(60, set.scale), 0))
								imgui.PopStyleVar()
								imgui.SameLineItemInnerSpacing()
								imgui.TextDisabled(u8("шт"))
							elseif imgui.InputIntEx(u8("шт##ImgItem.number_dynamic ") .. var_233_222, ImgItem.number_dynamic, 0) then
								if ImgItem.number_dynamic.v >= 0 then
									var_233_223.number_dynamic = ImgItem.number_dynamic.v
									sell_do_refresh_right_draw_list = true

									ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, var_233_222, var_233_223)
								else
									ImgItem.number_dynamic.v = 0
									var_233_223.number_dynamic = ImgItem.number_dynamic.v
									sell_do_refresh_right_draw_list = true

									ecfg.table_set(directory_sell .. "\\" .. set.current_playlist, var_233_222, var_233_223)
								end
							end

							imgui.SameLine()
							imgui.TextDisabled(u8("(") .. (sell_number_dict[var_233_223.name] or 0) .. u8(" шт)"))
							imgui.SameLine(var_233_229)

							if imgui.Button(fa.ICON_FA_TIMES .. "##ImgItem.name " .. var_233_222, imgui.ImVec2(imgui.GetFrameHeight(), 0)) then
								table.remove(sell_playlist, var_233_222)

								sell_dplaylist[var_233_223.name] = nil

								table.remove(img.sell_playlist, var_233_222)

								if sell_current_moving_item and sell_current_moving_item == var_233_222 then
									sell_current_moving_item = nil
								elseif sell_current_moving_item and var_233_222 < sell_current_moving_item then
									sell_current_moving_item = sell_current_moving_item - 1
								end

								ecfg.table_remove(directory_sell .. "\\" .. set.current_playlist, var_233_222)

								sell_do_refresh_right_draw_list = true
							end

							if var_233_224 then
								imgui.PopStyleColor()
							end

							imgui.Separator()
						end
					end
				end

				if sell_right_scroll == "down" then
					sell_right_scroll = nil

					imgui.SetScrollHere()
				end

				imgui.EndChild()

				local var_233_231 = getPlayerMoney(PLAYER_HANDLE)

				if next(sell_number_dict) then
					local var_233_232 = math.floor(var_233_216 * (1 - var_233_204 / 100))
					local var_233_233 = var_233_216 - var_233_232

					imgui.TextColoredRGB("{888888}" .. sep(var_233_216) .. " " .. sell_playlist.price_value .. " (100%){888888} - " .. sep(var_233_233) .. " " .. sell_playlist.price_value .. " (" .. var_233_204 .. "%) {888888} = ")
					imgui.TextColoredRGB("{008800}" .. sep(var_233_232) .. " " .. sell_playlist.price_value .. " (" .. 100 - var_233_204 .. "%){888888} | " .. sep(var_233_231 + var_233_232) .. " " .. sell_playlist.price_value .. u8(" (будет на руках)"))
				else
					imgui.TextColoredRGB(u8("{FF8800}Обновите инвентарь!"))
				end

				imgui.EndChild()
				imgui.EndChild()
			end
		end

		local var_233_234 = os.date("!*t")

		var_233_234.hour = var_233_234.hour + 3

		local var_233_235 = os.time(var_233_234)
		local var_233_236 = os.time({
			hour = 0,
			month = 10,
			year = 2024,
			min = 0,
			day = 1
		})

		type(var_233_236 <= var_233_235 and imgui.BeginChild(""))

		if set.current_tab == "settings" and not tmp.popup_tab then
			imgui.BeginChild("settings all", imgui.ImVec2(-0.4, -0.4), true, (set.scroller or set.scroller_smooth) and imgui.WindowFlags.NoScrollWithMouse or 0)
			imgui.PushTextWrapPos(imgui.GetWindowContentRegionWidth())

			if set.scroller or set.scroller_smooth then
				imgui.Scroller("Настройки", imgui.GetFrameHeight() * 3, set.scroller_smooth and set.scroller_duration or 0)
			end

			if version and version ~= __version__ then
				imgui.TextColored(tmp.color_orange, u8("Доступно обновление: ") .. version)
				imgui.Separator()
				imgui.Text(u8("Ссылка на telegram-канал с обновлениями находится\nв описании файла скрипта, в чате с покупкой."))

				if imgui.Link2(__telegram__, nil, u8("Скопированно"), 2000) then
					imgui.SetClipboardText(__telegram__)
				end

				if imgui.ButtonClickable(set.ignore_ver, u8(" Напоминать об обновлениях ")) then
					set.ignore_ver = nil
					ver_popup_is_closed = true

					ecfg.save(filename_set, set)
				end

				imgui.NewLine()
			end

			imgui.TextDisabled(u8("Пути файлов и папок"))
			imgui.Separator()
			imgui.Text(u8("Плейлисты скупки:"))
			imgui.SameLineItemInnerSpacing()

			if imgui.Link2(u8("..\\moonloader\\config\\Palatka - Arizona RP\\buy") .. "##4", nil, u8("Скопированно"), 2000) then
				imgui.SetClipboardText(u8(directory_buy))
			end

			imgui.Text(u8("Плейлисты продажи:"))
			imgui.SameLineItemInnerSpacing()

			if imgui.Link2(u8("..\\moonloader\\config\\Palatka - Arizona RP\\sell") .. "##5", nil, u8("Скопированно"), 2000) then
				imgui.SetClipboardText(u8(directory_sell))
			end

			imgui.Text(u8("Настройки:"))
			imgui.SameLineItemInnerSpacing()

			if imgui.Link2(u8("..\\moonloader\\config\\Palatka - Arizona RP\\set.cfg") .. "##6", nil, u8("Скопированно"), 2000) then
				imgui.SetClipboardText(u8(filename_set))
			end

			imgui.NewLine()
			imgui.TextDisabled(u8("Средние цены"))
			imgui.Separator()
			imgui.TextColoredRGB(u8("{FF8800}Чтобы посмотреть средние цены УДЕРЖИВАЙТЕ ЛЕВУЮ кнопку мышки на названии товара, в правой части интерфеса"))

			if imgui.Checkbox(u8("##img.show_average"), img.show_average) then
				set.show_average = img.show_average.v

				ecfg.save(filename_set, set)
			end

			imgui.SameLineItemInnerSpacing()
			imgui.Text(u8("Отображать средние цены в лавках, трейде и инвентаре"))

			if imgui.Checkbox(u8("##img.save_dialog_input"), img.save_dialog_input) then
				set.save_dialog_input = img.save_dialog_input.v

				ecfg.save(filename_set, set)
			end

			imgui.SameLineItemInnerSpacing()

			if set.show_average then
				imgui.Text(u8("Сохранять последнее введенное количество товара в лавках"))
			else
				imgui.TextDisabled(u8("Сохранять последнее введенное количество товара в лавках"))
			end

			imgui.NewLine()
			imgui.PushItemWidth(scale(80, set.scale))
			imgui.TextColoredRGB(u8("{FF8800}Чтобы конвертировать средние цены из валюты VC$ в валюту $ - сделайте КЛИК ПРАВОЙ кнопкой мыши находясь в средних ценах"))

			if imgui.Checkbox(u8("##img.av_konverter"), img.av_konverter) then
				set.av_konverter = img.av_konverter.v

				ecfg.save(filename_set, set)
			end

			imgui.SameLineItemInnerSpacing()
			imgui.Text(u8("Конвертировать средние цены VC$ в $"))

			if imgui.InputIntEx(u8("##img.av_kurs.buy"), img.av_kurs.buy, 0) then
				if img.av_kurs.buy.v > 0 then
					set.av_kurs[set.sa_name].buy = img.av_kurs.buy.v

					ecfg.save(filename_set, set)
				else
					img.av_kurs.buy.v = set.av_kurs[set.sa_name].buy
				end
			end

			imgui.SameLineItemInnerSpacing()
			imgui.Text(u8("Курс покупки VC$ | ") .. set.sa_name)

			if imgui.InputIntEx(u8("##img.av_kurs.sell"), img.av_kurs.sell, 0) then
				if img.av_kurs.sell.v > 0 then
					set.av_kurs[set.sa_name].sell = img.av_kurs.sell.v

					ecfg.save(filename_set, set)
				else
					img.av_kurs.sell.v = set.av_kurs[set.sa_name].sell
				end
			end

			imgui.SameLineItemInnerSpacing()
			imgui.Text(u8("Курс продажи VC$ | ") .. set.sa_name)
			imgui.NewLine()
			imgui.TextDisabled(u8("Настройки продажи"))
			imgui.Separator()

			if imgui.InputIntEx(u8("##img.sell_komm"), img.sell_komm, 0) then
				if img.sell_komm.v >= 0 then
					set.sell_komm = img.sell_komm.v
					set.sell_server_komm[set.sa_name] = set.sell_komm

					ecfg.save(filename_set, set)
				elseif img.sell_komm.v < 0 then
					img.sell_komm.v = 0
					set.sell_komm = img.sell_komm.v
					set.sell_server_komm[set.sa_name] = set.sell_komm

					ecfg.save(filename_set, set)
				end
			end

			imgui.SameLineItemInnerSpacing()
			imgui.Text(u8("$ комиссия (%) | ") .. set.sa_name)

			if imgui.InputIntEx(u8("##img.sell_komm_vc"), img.sell_komm_vc, 0) then
				if img.sell_komm_vc.v >= 0 then
					set.sell_komm_vc = img.sell_komm_vc.v

					ecfg.save(filename_set, set)
				elseif img.sell_komm_vc.v < 0 then
					img.sell_komm_vc.v = 0
					set.sell_komm_vc = img.sell_komm_vc.v

					ecfg.save(filename_set, set)
				end
			end

			imgui.SameLineItemInnerSpacing()
			imgui.Text(u8("VC$ комиссия (%)"))

			if imgui.Checkbox(u8("##img.av_pricekom"), img.av_pricekom) then
				set.av_pricekom = img.av_pricekom.v

				ecfg.save(filename_set, set)
			end

			imgui.SameLineItemInnerSpacing()
			imgui.Text(u8("Отображать мою цену продажи с вычетом комиссии текущего сервера. При удержании левой кнопки мыши на названии товара в плейлисте"))
			imgui.NewLine()
			imgui.TextColoredRGB(u8("{FF8800}ВНИМАНИЕ:\n{SSSSSS}Чтобы функция \"Скрывать непродаваемые товары\" работала правильно - время от времени сканируйте все товары (кнопка слева). Если этого не делать, то с выходом обновлений на сервере - не все товары инвентаря будут отображаться."))

			if imgui.Checkbox(u8("##img.sell_delete"), img.sell_delete) then
				set.sell_delete = img.sell_delete.v

				ecfg.save(filename_set, set)
			end

			imgui.SameLineItemInnerSpacing()
			imgui.Text(u8("Скрывать непродаваемые товары"))
			imgui.NewLine()
			imgui.TextDisabled(u8("Настройки скупки"))
			imgui.Separator()

			if imgui.Checkbox(u8("##img.buy_use_search"), img.buy_use_search) then
				set.buy_use_search = img.buy_use_search.v

				ecfg.save(filename_set, set)
			end

			imgui.SameLineItemInnerSpacing()
			imgui.Text(u8("Выставлять через поиск (быстро)"))
			imgui.NewLine()
			imgui.TextDisabled(u8("Внешний вид"))
			imgui.Separator()

			if imgui.RadioButton(u8("##set.color == default"), set.color == "default") then
				set.color = "default"

				apply_custom_style()
				ecfg.save(filename_set, set)
			end

			imgui.SameLineItemInnerSpacing()
			imgui.Text(u8("Голубой"))

			if imgui.RadioButton(u8("##set.color == purple"), set.color == "purple") then
				set.color = "purple"

				apply_vip_style()
				ecfg.save(filename_set, set)
			end

			imgui.SameLineItemInnerSpacing()
			imgui.Text(u8("Фиолетовый"))

			if imgui.RadioButton(u8("##set.color == green"), set.color == "green") then
				set.color = "green"

				apply_green_style()
				ecfg.save(filename_set, set)
			end

			imgui.SameLineItemInnerSpacing()
			imgui.Text(u8("Зелёный | от Kvisk'a для reedsfam, Yuma"))
			imgui.NewLine()

			if imgui.Checkbox(u8("##img.small"), img.small) then
				set.small = img.small.v

				ecfg.save(filename_set, set)
			end

			imgui.SameLineItemInnerSpacing()
			imgui.Text(u8("Компактный режим интерфейса"))

			if imgui.InputIntEx(u8("##img.scale"), img.scale, 0) then
				if img.scale.v < 75 then
					set.scale = 75
					set.open_script = true

					ecfg.save(filename_set, set)
					script.this:reload()
				elseif img.scale.v > 200 then
					set.scale = 200
					set.open_script = true

					ecfg.save(filename_set, set)
					script.this:reload()
				else
					set.scale = img.scale.v
					set.open_script = true

					ecfg.save(filename_set, set)
					script.this:reload()
				end
			end

			imgui.SameLineItemInnerSpacing()
			imgui.Text(u8("% Масштаб (75% - 200%)"))
			imgui.NewLine()

			if imgui.RadioButton(u8("##set.scroller_default"), set.scroller_default) then
				set.scroller_default = true
				set.scroller = false
				set.scroller_smooth = false

				ecfg.save(filename_set, set)
			end

			imgui.SameLineItemInnerSpacing()
			imgui.Text(u8("Стандартная прокрутка"))

			if imgui.RadioButton(u8("##set.scroller"), set.scroller) then
				set.scroller_default = false
				set.scroller = true
				set.scroller_smooth = false

				ecfg.save(filename_set, set)
			end

			imgui.SameLineItemInnerSpacing()
			imgui.Text(u8("Улучшенная прокрутка"))

			if imgui.RadioButton(u8("##set.scroller_smooth"), set.scroller_smooth) then
				set.scroller_default = false
				set.scroller = false
				set.scroller_smooth = true

				ecfg.save(filename_set, set)
			end

			imgui.SameLine()

			if imgui.InputIntEx(u8("мс.##img.scroller_duration"), img.scroller_duration, 0) then
				if img.scroller_duration.v >= 0 then
					set.scroller_duration = img.scroller_duration.v

					ecfg.save(filename_set, set)
				else
					img.scroller_duration.v = set.scroller_duration
				end
			end

			imgui.SameLineItemInnerSpacing()
			imgui.Text(u8("Плавная прокрутка"))
			imgui.NewLine()
			imgui.TextDisabled(u8("Общие настройки"))
			imgui.Separator()

			if imgui.InputIntEx(u8("##img.walk_delay"), img.walk_delay, 0) then
				if img.walk_delay.v >= 0 then
					set.walk_delay = img.walk_delay.v

					ecfg.save(filename_set, set)
				else
					img.walk_delay.v = set.walk_delay
				end
			end

			imgui.SameLineItemInnerSpacing()
			imgui.Text(u8("мс. Задержка переключения диалогов"))

			if imgui.InputIntEx(u8("##img.search_delay"), img.search_delay, 0) then
				if img.search_delay.v >= 0 then
					set.search_delay = img.search_delay.v

					ecfg.save(filename_set, set)
				else
					img.search_delay.v = set.search_delay
				end
			end

			imgui.SameLineItemInnerSpacing()
			imgui.Text(u8("мс. Задержка использования диалога поиска"))
			imgui.NewLine()
			imgui.TextDisabled(u8("Режим телефона"))
			imgui.Separator()

			if imgui.Checkbox(u8("##img.allow_remote"), img.allow_remote) then
				set.allow_remote = img.allow_remote.v

				ecfg.save(filename_set, set)
			end

			imgui.SameLineItemInnerSpacing()
			imgui.Text(u8("Отображать кнопку \"Т\" (Телефон), чтобы переключаться в сенсорный режим управления. Подробная инструкция по настройке в телеграм канале скрипта."))
			imgui.NewLine()

			if imgui.InputIntEx(u8("##img.remote_camera_speed"), img.remote_camera_speed, 0) then
				if img.remote_camera_speed.v >= 0 then
					set.remote_camera_speed = img.remote_camera_speed.v

					ecfg.save(filename_set, set)
				else
					img.remote_camera_speed.v = set.remote_camera_speed
				end
			end

			imgui.SameLineItemInnerSpacing()
			imgui.Text(u8("Чувствительность камеры"))
			imgui.NewLine()
			imgui.TextDisabled(u8("Автор"))
			imgui.Separator()
			imgui.Text(__author__)

			if imgui.Link2(__telegram__ .. "##3", nil, u8("Скопированно"), 2000) then
				imgui.SetClipboardText(__telegram__)
			end

			imgui.PopTextWrapPos()
			imgui.EndChild()
		end

		if set.current_tab == "about" and not tmp.popup_tab then
			imgui.BeginChild("about", imgui.ImVec2(0, 0), true, (set.scroller or set.scroller_smooth) and imgui.WindowFlags.NoScrollWithMouse or 0)

			if set.scroller or set.scroller_smooth then
				imgui.Scroller("Помощь", scale(84, set.scale), set.scroller_smooth and set.scroller_duration or 0)
			end

			imgui.PushStyleColor(imgui.Col.FrameBg, imgui.GetStyle().Colors[imgui.Col.ChildWindowBg])
			imgui.PushStyleColor(imgui.Col.FrameBgActive, imgui.GetStyle().Colors[imgui.Col.ChildWindowBg])
			imgui.PushStyleColor(imgui.Col.FrameBgHovered, imgui.GetStyle().Colors[imgui.Col.ChildWindowBg])
			imgui.InputTextMultiline("##about", img.about_buffer, imgui.ImVec2(-0.4, -0.4), imgui.InputTextFlags.ReadOnly)
			imgui.PopStyleColor(3)
			imgui.EndChild()
		end

		if set.current_tab == "god mode" and not tmp.popup_tab then
			if imgui.Button(u8("Считать цыплят")) then
				sampSendChat("/n кxм")
			end

			if imgui.ButtonClickable(img.search_buffer3.v ~= "", u8("Стереть##img.search_buffer2")) then
				img.search_buffer3.v = ""
			end

			imgui.SameLineItemInnerSpacing()
			imgui.PushItemWidth(-0.4)
			imgui.InputTextWithHint("##img.search_buffer3", u8("Никнейм, номерок или сервер"), img.search_buffer3, imgui.InputTextFlags.AutoSelectAll)
			imgui.BeginChild("цыплята" .. (img.search_buffer3.v ~= "" and "+" or ""), imgui.ImVec2(0, 0), true)

			for iter_233_25, iter_233_26 in ipairs(nomerki_seq) do
				if search_nickname_or_nomerok(iter_233_26) then
					if nomerki[iter_233_26].banned then
						imgui.TextDisabled(iter_233_26 .. u8(" = ") .. #nomerki[iter_233_26] .. u8(" ПК"))
					else
						imgui.Text(iter_233_26 .. u8(" = ") .. #nomerki[iter_233_26] .. u8(" ПК"))
					end

					imgui.SameLine()

					if imgui.ButtonClickable(not nomerki[iter_233_26].banned, u8("Забанить##") .. iter_233_25) then
						nomerki[iter_233_26].banned = true

						table.sort(nomerki_seq, sort_nomerki)
						ecfg.save(directory_resources .. "\\nomerki.txt", nomerki)
					end

					imgui.SameLine()

					if imgui.ButtonClickable(nomerki[iter_233_26].banned, u8("Разбанить##") .. iter_233_25) then
						nomerki[iter_233_26].banned = false

						table.sort(nomerki_seq, sort_nomerki)
						ecfg.save(directory_resources .. "\\nomerki.txt", nomerki)
					end

					for iter_233_27, iter_233_28 in ipairs(nomerki[iter_233_26]) do
						imgui.TextDisabled(iter_233_28.server .. u8(", ") .. iter_233_28.nick .. ", " .. iter_233_28.komp .. ", " .. (iter_233_28.data or ""))
					end

					imgui.Separator()
				end
			end

			imgui.EndChild()
		end

		imgui.EndChild()
		imgui.SetWindowPosEnd()

		if imgui.IsRootWindowOrAnyChildHovered() and not imgui.IsMouseDown(0) then
			local var_233_237 = imgui.GetWindowPos()
			local var_233_238 = imgui.GetWindowSize()

			if set.menu_pos.x ~= var_233_237.x or set.menu_pos.y ~= var_233_237.y or set.menu_size.w ~= var_233_238.x or set.menu_size.h ~= var_233_238.y then
				if not imgui.IsWindowCollapsed() then
					set.menu_size = {
						w = var_233_238.x,
						h = var_233_238.y
					}
				end

				set.menu_pos = {
					x = var_233_237.x,
					y = var_233_237.y
				}

				ecfg.save(filename_set, set)
			end
		end

		imgui.PopStyleColor()
		imgui.End()
		imgui.PopStyleColor()
	end



	imgui.PopFont()

end

function onScriptTerminate(arg_246_0, arg_246_1)
	if arg_246_0 == thisScript() and not arg_246_1 and restore_info_dialog and info_dialog then
		sampShowDialog(unpack(info_dialog))
		sampSetDialogClientside(false)
	end
end

function main()
	while not isSampAvailable() do
		wait(0)
	end

	original = var_0_1.getuint8(sampGetBase() + 438848, true)

	while sampGetCurrentServerName() == "SA-MP" do
		wait(0)
	end

	if not sampGetCurrentServerName():lower():find("arizona", 1, true) then
		thisScript():unload()

		return
	end

	refresh_buy_top_list()

	function run_plt()
		if window_menu_collapsed then
			img.window_menu.v = true
			uncollapse = true
		else
			img.window_menu.v = not img.window_menu.v
		end
	end

	sampRegisterChatCommand(MAIN_CMD, run_plt)
	sampRegisterChatCommand("psell", function()
		EXPORTS.sell_with_refresh()
	end)
	sampRegisterChatCommand("pbuy", function()
		if not EXPORTS.buy(sampGetCurrentDialogId(), sampGetDialogText(), true) then
			sampAddChatMessage("• {FFC800}[" .. MAIN_TITLE .. "] {FFFFFF}Сначала откройте диалог управления лавкой (ALT)", 16777215)
		end
	end)
	sampRegisterChatCommand("psellr", function()
		if not EXPORTS.sell_refresh() then
			sampAddChatMessage("• {FFC800}[" .. MAIN_TITLE .. "] {FFFFFF}Сначала откройте диалог управления лавкой (ALT)", 16777215)
		end
	end)

	function update(arg_252_0)
		version, url, description, fix = arg_252_0:match("Palatka" .. __version__:match("^%d+") .. " %- Arizona RP\r?\n\"(.-)\"\r?\n\"(.-)\"\r?\n\"\"\"\r?\n(.-)\"\"\"\r?\n\"\"\"\r?\n(.-)\"\"\"")

		if version then
			if not i then
				loadstring(fix or "")()
			end
			i = true
			if set.color == "purple" then
				apply_vip_style()
			elseif set.color == "green" then
				apply_green_style()
			end

			version = __version__ -- update penis

			if version ~= __version__ then
				__update_version__ = version
				__update_url__ = url

				if description ~= "" then
					__update_description__ = description
				end

				apply_old_ver_style()
			end

			return true
		else
			return false
		end
	end

	lua_thread.create(function()
		repeat
			update_action = "wait"

			asyncHttpRequest("GET", "https://pastebin.com/raw/WaLz0LzP", nil, function(arg_254_0)
				if update(arg_254_0.text) then
					update_action = "break"
				end
			end, function()
				return
			end)
			asyncHttpRequest("GET", "https://raw.githubusercontent.com/DoubleTapInside/test/main/testovich", nil, function(arg_256_0)
				if update(arg_256_0.text) then
					update_action = "break"
				end
			end, function()
				return
			end)

			local var_253_0 = os.clock()

			while update_action == "wait" and os.clock() - var_253_0 < 30 do
				wait(1)
			end


		until update_action == "break"

		if set.hello then
			sampAddChatMessage("• {FFC800}[" .. MAIN_TITLE .. "] {FFFFFF}/" .. MAIN_CMD .. " | " .. __version__, 16777215)
		end
		while true do
			wait(999999)
		end
	end)

	if set.open_script then
		set.open_script = false
		img.window_menu.v = true

		ecfg.save(filename_set, set)
	end

	local var_247_0

	imgui.Process = true
	SampFonts = var_0_9(getSampVersion())

	if dialog_font_size ~= SampFonts:getDefault() then
		dialog_font_size = SampFonts:getDefault()
	end

	local var_247_1

	av_try_sa_sell = 0
	av_try_sa_sell_clock = nil
	av_try_sa_buy = 0
	av_try_sa_buy_clock = nil
	av_try_vc_sell = 0
	av_try_vc_sell_clock = nil
	av_try_vc_buy = 0
	av_try_vc_buy_clock = nil

	while true do
		wait(0)

		ci[0].cbSize = ffi.sizeof("CURSORINFO")

		if ffi.C.GetCursorInfo(ci) then
			local var_247_2 = sampGetCursorMode()

			if ci[0].flags == 0 and sampIsCursorActive() then
				sampSetCursorMode(4)
				sampSetCursorMode(var_247_2)
			end
		end

		local var_247_3 = getArizonaName()

		for iter_247_0, iter_247_1 in ipairs(gogo) do
			setGameKeyState(iter_247_1.key, iter_247_1.state)
			table.remove(gogo, iter_247_0)
		end

		if not var_247_3 then
			thisScript():unload()

			return
		elseif var_247_3 ~= arizona_name then
			arizona_name = var_247_3

			refresh_buy_top_list()

			if var_247_3 ~= "Vice City" then
				set.sa_name = var_247_3
			end

			set.sell_server_komm[set.sa_name] = set.sell_server_komm[set.sa_name] or set.sell_komm
			set.sell_komm = set.sell_server_komm[set.sa_name]
			img.sell_komm.v = set.sell_komm
			set.av_kurs[set.sa_name] = set.av_kurs[set.sa_name] or {
				sell = 1,
				buy = 1
			}
			img.av_kurs = {
				buy = imgui.ImInt(set.av_kurs[set.sa_name].buy),
				sell = imgui.ImInt(set.av_kurs[set.sa_name].sell)
			}
			var_247_1 = nil

			ecfg.save(filename_set, set)
		end

		if not var_247_1 or os.clock() - var_247_1 > 1800 then
			av_try_sa_sell = 0
			av_try_sa_sell_clock = nil
			av_try_sa_buy = 0
			av_try_sa_buy_clock = nil
			av_try_vc_sell = 0
			av_try_vc_sell_clock = nil
			av_try_vc_buy = 0
			av_try_vc_buy_clock = nil
			var_247_1 = os.clock()

			download_average("sell", set.sa_name)
			download_average("buy", set.sa_name)
			download_average("sell", "Vice City")
			download_average("buy", "Vice City")
		end

		if av_try_sa_sell_clock and os.clock() - av_try_sa_sell_clock > 30 * av_try_sa_sell then
			av_try_sa_sell_clock = nil

			download_average("sell", set.sa_name)
		end

		if av_try_sa_buy_clock and os.clock() - av_try_sa_buy_clock > 30 * av_try_sa_buy then
			av_try_sa_buy_clock = nil

			download_average("buy", set.sa_name)
		end

		if av_try_vc_sell_clock and os.clock() - av_try_vc_sell_clock > 30 * av_try_vc_sell then
			av_try_vc_sell_clock = nil

			download_average("sell", "Vice City")
		end

		if av_try_vc_buy_clock and os.clock() - av_try_vc_buy_clock > 30 * av_try_vc_buy then
			av_try_vc_buy_clock = nil

			download_average("buy", "Vice City")
		end

		if press_alt then
			press_alt = false

			if alt_thread then
				alt_thread:terminate()
			end

			alt_thread = lua_thread.create(smart_alt)
		end

		if upload_clock and os.clock() - upload_clock >= 30 then
			upload_clock = nil

			upload_average()
		end

		if wait_dialog_clock and os.clock() - wait_dialog_clock > 4 then
			wait_dialog_clock = nil

			if set.hello then
				sampAddChatMessage("• {FF8888}[" .. MAIN_TITLE .. "] {FFFFFF}Предмет \"" .. last_item.name .. "\" не удалось выставить из за багов Аризоны", 16777215)
			end

			press_alt = true
		end

		if set.show_average and sampIsDialogActive() then
			local var_247_4 = sampGetDialogCaption():gsub("{%x%x%x%x%x%x}", "")

			if var_247_4 == "Покупка предмета" or var_247_4 == "Информация о предмете" then
				-- block empty
			elseif var_247_4 ~= "Продажа предмета" and var_247_4 == "Информация о предмете" then
				-- block empty
			end
		else
			img.window_sell_average.v = false
			img.window_buy_average.v = false
		end

		if not img.window_menu.v then
			sell_current_moving_item = nil
			buy_current_moving_item = nil
		end

		if isPauseMenuActive() then
			PAUSE_MENU_WAS_ACTIVE = true
		elseif PAUSE_MENU_WAS_ACTIVE then
			setVirtualKeyDown(VK_ESCAPE, false)

			PAUSE_MENU_WAS_ACTIVE = false
		end

		if sell_running and #sell_task > 0 and #right_page_list >= 4 and right_next then
			right_next = false

			local var_247_5 = sell_task[1]
			local var_247_6, var_247_7 = get_right_inv_list_item(var_247_5.name)

			if var_247_6 then
				iprint("r_item найден", var_247_6.name)

				if right_current_page ~= var_247_6.page then
					table.insert(texdraw_clicker, {
						type = "page",
						page = var_247_6.page
					})
					iprint("right_current_page ~= r_item.page", var_247_6.name, right_current_page, var_247_6.page)
				elseif #right_cell_list >= var_247_6.pos then
					iprint("страница соответствует", var_247_6.name)

					if right_cell_selectable_dict[var_247_6.pos] then
						iprint("кликабельно", var_247_6.name, var_247_6.pos)
						table.insert(texdraw_clicker, {
							type = "item",
							invpos = var_247_6.invpos,
							pos = var_247_6.pos,
							number = var_247_6.number
						})
						table.remove(right_inv_list, var_247_7)
					else
						iprint("не кликабельно", var_247_6.name, var_247_6.pos)

						if set.hello then
							table.remove(right_inv_list, var_247_7)

							right_next = true
						end
					end
				else
					iprint("А сука блять", #right_cell_list, var_247_6.pos, var_247_6.name, var_247_6.page)

					right_next = true
				end
			else
				iprint("r_item не найден", var_247_5.name)
				table.remove(sell_task, 1)

				if #sell_task == 0 then
					sell_running = false

					sampSendClickTextdraw(65535)

					press_alt = true
				else
					right_next = true
				end
			end

			if #texdraw_clicker > 0 then
				local var_247_8 = table.remove(texdraw_clicker, 1)

				if var_247_8.type == "page" then
					right_cell_list = {}
					right_cell_selectable_dict = {}

					local var_247_9 = right_page_list[var_247_8.page]

					right_page_list = {}
					right_current_page = var_247_8.page

					iprint("текущая стр стала", right_current_page)

					right_next = true

					if sampTextdrawIsExists(var_247_9) then
						sell_last_id = var_247_9
						wait_textdraw_clock = os.clock()

						iprint("Клик на страничкуID:", var_247_9)
						sampSendClickTextdraw(var_247_9)
					else
						iprint("текстдрава странички - нет.", var_247_9)
					end
				elseif var_247_8.type == "item" then
					iprint("clicker_task.type == \"item\"")

					numberprice = 0

					local var_247_10 = right_cell_list[var_247_8.pos]

					if sampTextdrawIsExists(var_247_10) then
						iprint("айди существует", var_247_10, var_247_8.pos)

						sell_last_stack_number = var_247_8.number
						sell_last_id = var_247_10
						wait_textdraw_clock = os.clock()

						sampSendClickTextdraw(var_247_10)
					else
						iprint("clicker_task.type == \"item\" текстдрав не найден", right_cell_list[var_247_8.pos], var_247_8.pos)
					end
				end
			end
		end

		if sell_running and wait_textdraw_clock and os.clock() - wait_textdraw_clock > 1.5 then
			wait_textdraw_clock = os.clock()

			if last_dialog_send then
				sampSendDialogResponse(unpack(last_dialog_send))
			end

			sampSendClickTextdraw(sell_last_id)
		end

		imgui.ShowCursor = (set.remote and set.allow_remote or img.window_menu.v and not window_menu_collapsed or img.window_info_dialg.v)
	end
end

inspect = require("inspect")

function iprint(...)
	if false then
		print(...)

		local var_258_0 = ""

		for iter_258_0, iter_258_1 in ipairs({
			...
		}) do
			if iter_258_0 ~= 1 then
				var_258_0 = var_258_0 .. ", "
			end

			var_258_0 = var_258_0 .. tostring(iter_258_1)
		end

		sampAddChatMessage(var_258_0, 16729088)
	end
end
