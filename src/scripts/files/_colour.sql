DO $$                  
    BEGIN 
        IF EXISTS
            ( SELECT 1
              FROM   information_schema.tables 
              WHERE  table_schema = 'util'
              AND    table_name = 'Color'
            )
        THEN
            INSERT INTO util."Color" (hex_code,name) VALUES
				('#FF7F50','Coral'),
				('#4B0082','Indigo'),
				('#50C878','Emerald Green'),
				('#FFA500','Fiery Orange'),
				('#39FF14','Neon Green'),
				('#8A2BE2','Deep Purple'),
				('#FF0000','Cherry Red'),
				('#4169E1','Royal Blue'),
				('#DAA520','Goldenrod'),
				('#FF00FF','Magenta');
		
			INSERT INTO util."Color" (hex_code,name) VALUES
				('#40E0D0','Turquoise'),
				('#008080','Teal'),
				('#FFDAB9','Peach'),
				('#800000','Maroon'),
				('#708090','Slate'),
				('#D8BFD8','Lavender'),
				('#87CEEB','Sky Blue');
        END IF ;
    END
$$ ;

