#!/usr/bin/env lua

JSON = (loadfile("JSON.lua"))()

local leftpad = {}
leftpad.js = function(str, with, num)
    if string.len(str) < num then
        res = str
        for i = num, string.len(str) + 1, -1 do
            res = res .. with
        end
        return res
    else
        return str
    end
end

print("Reading f2b logs")

file = io.open("/var/log/fail2ban.log")
if not file then
    print("Could not open f2b logs. Are you root?")
    os.exit()
end

print("Parsing logs")

banned_ips = {}
for line in file:lines() do
    ip = string.match(line, "Ban (.+)")
    if ip then
        table.insert(banned_ips, ip)
    end
end
file:close()

spinner = {"-", "\\", "|", "/"}

io.write("Getting locations ")
locations = {}
num_locations = 0
longest_name = 0
for k, ip in ipairs(banned_ips) do
    io.write(spinner[(k % #spinner) + 1])
    json = io.popen("curl -s freegeoip.net/json/" .. ip):read("*a")
    location = JSON:decode(json)

    if location["city"] == "" then
        location["city"] = "unknown"
    end

    locations[ip] = location["city"] .. ", " .. location["country_name"]
    num_locations = num_locations + 1

    if longest_name < string.len(locations[ip]) then
        longest_name = string.len(locations[ip])
    end

    io.write("\b \b")
end

print("\nFound " .. num_locations .. " locations")

for ip, place in pairs(locations) do
    print(leftpad.js(place .. ":", " ", longest_name + 4) .. tostring(ip))
end

