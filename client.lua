Citizen.CreateThread(function()
	while true do
		local ped = GetPlayerPed(-1)
		if(IsPedInAnyVehicle(ped)) then
			local vehicle = GetVehiclePedIsIn(ped, false)
			if vehicle and GetPedInVehicleSeat(vehicle, -1) == ped then
				carSpeed = math.ceil(GetEntitySpeed(vehicle) * 2.237)
				carRPM = GetVehicleCurrentRpm(vehicle)
				SendNUIMessage({
					displayhud = true,
					speed = carSpeed,
					RPM = carRPM
				})
			else
				SendNUIMessage({
					displayhud = false
				})
				Citizen.Wait(1000)
			end
		else
			SendNUIMessage({
				displayhud = false
			})
			Citizen.Wait(100)
		end
		Citizen.Wait(1)
	end
end)