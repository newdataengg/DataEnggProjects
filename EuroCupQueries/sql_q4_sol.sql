SELECT 
    play_stage, COUNT(*) AS no_subs
FROM
    euro_cup_2016.match_details md,
    (SELECT 
        match_no, COUNT(*)
    FROM
        euro_cup_2016.player_in_out
    WHERE
        in_out = 'I' -- This is to select 1 row per in/out
    GROUP BY match_no) pio
WHERE
    pio.match_no = md.match_no
GROUP BY md.play_stage;