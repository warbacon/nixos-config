-- Selecciona automáticamente subtítulos en español, evitando los que contengan "Latin" en su nombre.

mp.register_event("file-loaded", function()
	local tracks = mp.get_property_native("track-list")
	local current_sid = mp.get_property_number("sid", 0)
	local current_sub = nil

	-- Buscar el subtítulo actual
	for _, track in ipairs(tracks) do
		if track.id == current_sid and track.type == "sub" then
			current_sub = track
			break
		end
	end

	-- Verificar si current_sub existe antes de acceder a sus propiedades
	if not current_sub then
		mp.msg.info("No hay subtítulo seleccionado actualmente.")
		return
	end

	-- Verificar el idioma y si está forzado
	if current_sub.lang ~= "spa" and current_sub.lang ~= "es" or current_sub.forced then
		mp.msg.info("El subtítulo actual no es español o está forzado. No se realizará ningún cambio.")
		return
	end

	-- Verificar si el título contiene "Latin"
	if current_sub.title and current_sub.title:lower():match("latin") then
		for _, track in ipairs(tracks) do
			if
				track.type == "sub"
				and (track.lang == "spa" or track.lang == "es")
				and track.title
				and not track.title:lower():match("latin")
			then
				if track.id ~= current_sid then
					mp.set_property("sid", track.id)
					mp.msg.info("Cambiado a subtítulo en español sin 'Latin': " .. (track.title or "sin título"))
					return
				end
			end
		end
	end

	mp.msg.info("Todo bien 👍.")
end)
