SELECT 
    pm.player_name
FROM
    euro_cup_2016.player_in_out pio,
    euro_cup_2016.player_mast pm
WHERE
    pio.play_schedule = 'NT'
        AND pio.play_half = 1
        AND pio.in_out = 'I'
        AND pio.team_id = pm.team_id
        AND pio.player_id = pm.player_id;