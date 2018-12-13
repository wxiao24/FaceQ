function [db] = comparevalue(eye_value_db, nose_value_db, mouth_value_db, orig_img)

new_db = [];

%Size Ratio
eyesnose_ratio = eye_value_db(1, 1) / nose_value_db(1, 1);
eyesmouth_ratio = eye_value_db(1, 1) / mouse_value_db(1, 1);
mouthnose_ratio = nose_value_db(1, 1) / mouse_value_db(1, 1);

%Major Axis Length Ratio
en_major_ratio = eye_value_db(1, 11) / nose_value_db(1, 11);
em_major_ratio = eye_value_db(1, 11) / mouse_value_db(1, 11);
mn_major_ratio = nose_value_db(1, 11) / mouse_value_db(1, 11);


%Minor Axis Length Ratio
en_minor_ratio = eye_value_db(1, 12) / nose_value_db(1, 12);
em_minor_ratio = eye_value_db(1, 12) / mouse_value_db(1, 12);
mn_minor_ratio = nose_value_db(1, 12) / mouse_value_db(1, 12);

%keep properties in the databas updated
new_db = [eyesnose_ratio eyesmouth_ratio mouthnose_ratio;
            en_major_ratio em_major_ratio mn_major_ratio;
            en_minor_ratio em_minor_ratio mn_minor_ratio;] ;
       
db = new_db;

end