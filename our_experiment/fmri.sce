################################################################
#
# Neural correlates of vicarious pain
# 
# Group 5
#
###############################################################
# Header
scenario = "fMRI";

# fmri 
scenario_type = "fMRI_emulation";
scan_period = 2000;

#####
#
# SUBJECT INFO
#
#####
$gender = "female"; # Gender is either 'male' or 'female'

#TODO
# - 10 seconds between blocks
# - Calculate blocks again
# - Remove text in the 60 seconds wait time?

# One stimuli + isi takes 2s approximately
# Break between blocks is 10s
# Roughly we can say that its 20 seconds for a block
$isi_min 			= 1000;
$isi_max 			= 2000;
$n_pictures_block = 8; 	# How many similar images each block? (same race, same pain / no-pain)
$n_blocks 			= 19;  # How many of these blocks in one session? subtract one because of our initial (19) 
$n_sessions			= 3; 	# How many sessions?

# How many stimuli in the arrays?
# UPDATE THIS TO REAL VALUE - 1
$n_pain_asian_female    = 14;
$n_pain_asian_male      = 19;
$n_pain_black_female    = 35;
$n_pain_black_male      = 36;
$n_pain_latin_female    = 13;
$n_pain_latin_male      = 12;
$n_pain_white_female    = 21;
$n_pain_white_male      = 65;

$n_neutral_asian_female = 28;
$n_neutral_asian_male   = 21;
$n_neutral_black_female = 36;
$n_neutral_black_male   = 36;
$n_neutral_latin_female = 20;
$n_neutral_latin_male   = 14;
$n_neutral_white_female = 37;
$n_neutral_white_male   = 44;


###
# Folders
###
$root_folder      = "data";
$pain_folder 	   = "pain";
$neutral_folder   = "neutral";
$scrambled_folder = "scrambled";
# Subfolders
$asian_female 		= "Asian_female";
$asian_male	 		= "Asian_male";
$black_female 		= "Black_female";
$black_male	 		= "Black_male";
$latin_female 		= "Latinx_female";
$latin_male	 		= "Latinx_male";
$white_female 		= "White_female";
$white_male	 		= "White_male";

# PRELOAD??
$preload = false;
$width = 800;
$height = 800;

# Headers
default_background_color = 128,128,128;
default_picture_duration = 500;
default_trial_start_delay = 7500; # original delay of 2500 ms + 7500 should be roughly 10 seconds
no_logfile = false;

# Button options
active_buttons = 1;
button_codes = 1;

# fMRI
pulse_width = 6;
pulse_code = 30;
pulses_per_scan = 1; # Pulse leaves when the first cross section cut is done

##
# Begin Scenario Definition Language part
##
begin;

# Fixation cross
box {
   height = 3;
   width = 11;
   color = 0,0,0;
} horizfix;

box {
   height = 11;
   width = 3;
   color = 0,0,0;
} vertfix;

# Default picture
picture {
	box horizfix;
	x = 0; y = 0;
	box vertfix;
	x = 0; y = 0;
} default;

array {
	LOOP $i $n_pictures_block;
		picture { bitmap { preload = false; }; x = 0; y = 0; };
	ENDLOOP;
} pic;

#####
# Stimuli arrays
#####
# Asian
array {
	LOOP $i $n_pain_asian_female;
	bitmap { filename = "$root_folder/$pain_folder/$asian_female/$i.png"; preload = $preload; width = $width; height = $height;alpha = -1;}; 
	ENDLOOP;
} pain_asian_female;

array {
	LOOP $i $n_pain_asian_male;
	bitmap { filename = "$root_folder/$pain_folder/$asian_male/$i.png"; preload = $preload; width = $width; height = $height;alpha = -1;}; 
	ENDLOOP;
} pain_asian_male;

# Latin
array {
	LOOP $i $n_pain_latin_male;
	bitmap { filename = "$root_folder/$pain_folder/$latin_male/$i.png"; preload = $preload; width = $width; height = $height;alpha = -1;}; 
	ENDLOOP;
} pain_latin_male;

array {
	LOOP $i $n_pain_latin_female;
	bitmap { filename = "$root_folder/$pain_folder/$latin_female/$i.png"; preload = $preload; width = $width; height = $height;alpha = -1;}; 
	ENDLOOP;
} pain_latin_female;

# Black
array {
	LOOP $i $n_pain_black_male;
	bitmap {filename = "$root_folder/$pain_folder/$black_male/$i.png"; preload = $preload;  width = $width; height = $height; alpha = -1;};
	ENDLOOP;
} pain_black_male;

array {
	LOOP $i $n_pain_black_female;
	bitmap {filename = "$root_folder/$pain_folder/$black_female/$i.png"; preload = $preload;  width = $width; height = $height; alpha = -1;};
	ENDLOOP;
} pain_black_female;

# White
array {
	LOOP $i $n_pain_white_male;
	bitmap {filename = "$root_folder/$pain_folder/$white_male/$i.png"; preload = $preload;  width = $width; height = $height; alpha = -1;};
	ENDLOOP;
} pain_white_male;

array {
	LOOP $i $n_pain_white_female;
	bitmap {filename = "$root_folder/$pain_folder/$white_female/$i.png"; preload = $preload;  width = $width; height = $height; alpha = -1;};
	ENDLOOP;
} pain_white_female;

#####
# Neutral arrays
#####
# Asian
array {
	LOOP $i $n_neutral_asian_male;
	bitmap { filename = "$root_folder/$neutral_folder/$asian_male/$i.png"; preload = $preload; width = $width; height = $height;alpha = -1; };
	ENDLOOP;
} neutral_asian_male;

array {
	LOOP $i $n_neutral_asian_female;
	bitmap { filename = "$root_folder/$neutral_folder/$asian_female/$i.png"; preload = $preload; width = $width; height = $height;alpha = -1; };
	ENDLOOP;
} neutral_asian_female;

# Latin
array {
	LOOP $i $n_neutral_latin_male;
	bitmap { filename = "$root_folder/$neutral_folder/$latin_male/$i.png"; preload = $preload; width = $width; height = $height;alpha = -1; };
	ENDLOOP;
} neutral_latin_male;

array {
	LOOP $i $n_neutral_latin_female;
	bitmap { filename = "$root_folder/$neutral_folder/$latin_female/$i.png"; preload = $preload; width = $width; height = $height;alpha = -1; };
	ENDLOOP;
} neutral_latin_female;

# Black
array {
	LOOP $i $n_neutral_black_male;
	bitmap {filename = "$root_folder/$neutral_folder/$black_male/$i.png"; preload = $preload;  width = $width; height = $height; alpha = -1;};
	ENDLOOP;
} neutral_black_male;

array {
	LOOP $i $n_neutral_black_female;
	bitmap {filename = "$root_folder/$neutral_folder/$black_female/$i.png"; preload = $preload;  width = $width; height = $height; alpha = -1;};
	ENDLOOP;
} neutral_black_female;

# White
array {
	LOOP $i $n_neutral_white_male;
	bitmap {filename = "$root_folder/$neutral_folder/$white_male/$i.png"; preload = $preload;  width = $width; height = $height; alpha = -1;};
	ENDLOOP;
} neutral_white_male;

array {
	LOOP $i $n_neutral_white_female;
	bitmap {filename = "$root_folder/$neutral_folder/$white_female/$i.png"; preload = $preload;  width = $width; height = $height; alpha = -1;};
	ENDLOOP;
} neutral_white_female;



## Trials
trial {
	trial_duration = 2000;
	
	picture default;
	time = 0;
	code = "start_experiment";
	port_code = 1;
} start_experiment;

trial {
	
} block;

#####
# Begin Presentation Coding Language
#####
begin_pcl;

########################################
#
# PCL VARIABLES
#
########################################
##
## CUSTOM VARIABLES
##
####
# Start experiment
####

# Wait for MRI
int dummies = 4;
loop until pulse_manager.main_pulse_count() >= dummies begin 
default.present(); 
end;

bool use_button = true;


# Typecast our variable n_blocks to integer
# get_sdl_variable returns string
int n_blocks 			 = int(get_sdl_variable("n_blocks"));
int n_pictures_block  = int(get_sdl_variable("n_pictures_block"));
int n_sessions 		 = int(get_sdl_variable("n_sessions"));
int isi_min 			 = int(get_sdl_variable("isi_min"));
int isi_max 			 = int(get_sdl_variable("isi_max"));
string subject_gender = get_sdl_variable("gender");

# Ratio of pain to no-pain images
double pain_no_pain_ratio = 0.33;

# Array for keeping the similarity codes
# PCL doesn't support multiple returns so must be done the 'ugly' way
array<int> final_sim_array[n_pictures_block];
array<int> image_folder_number[n_pictures_block];
int current_image_index = 1;

# Define category/race
array<string> category_array[] = { "white", "asian", "latin", "black" };

output_file out = new output_file;
out.open("custom_debug_fmri.txt");

########################################
#
# SUBROUTINES
#
########################################
sub initialize_stimulus_block ( array<bitmap> stimulus_array[], string stimulus_name, int delta_time, bool is_pain_picture )
#######
# Prepare block for displaying
# Initialize image and stimulus timing
######
begin
	out.print_line("Entered initialize_stimulus_block. Time: " + string(clock.time()));
	loop int i = 1 until i > n_pictures_block
	begin
		# Set bitmap to image
		pic[i].set_part( 1, stimulus_array[i] );
		string code = stimulus_name + string(i) + "_pain_" + string(is_pain_picture) + "_" + string(image_folder_number[i]);
		int similarity_value = final_sim_array[i];

		if (n_pictures_block == 1) then
			block.add_stimulus_event( pic[i], i );
			stimulus_event event = block.get_stimulus_event( i );
			event.set_description( code );
			event.set_duration(500);
			event.set_deltat( delta_time );
			event.set_port_code( similarity_value ); # FOR MEG
			
			# Set event properties
			event.set_event_code( code );
		else
			# Set pictures
			block.add_stimulus_event( pic[i], i );
			stimulus_event event = block.get_stimulus_event( i );
			event.set_description( code );
			event.set_duration(500);
			event.set_deltat( delta_time + 500 ); # + 500 because our picture stimuli length is 500ms
			event.set_port_code( similarity_value ); # FOR MEG
			
			# Set event properties
			event.set_event_code( code );
			
		end;
		i = i + 1;
	end;
end;

sub bitmap draw_random_bitmap ( array<bitmap> bmp_array[] )
######
# Draw random index of a bitmap and load it
# PRIVATE METHOD
######
begin
	int image_index = random(1, bmp_array.count());
	int folder_index = image_index - 1;
	
	# If we are on next trial, reset indexing
	if (current_image_index > image_folder_number.count()) then
		current_image_index = 1;
	end;
	
	# Save image number
	image_folder_number[current_image_index] = folder_index;
	current_image_index = current_image_index + 1;
	
	out.print_line("folder index: " + string(folder_index));
	bmp_array[image_index].load();
	bitmap loaded_bitmap = bmp_array[image_index];
	return loaded_bitmap;
end;

sub bitmap load_bitmap ( string category, string gender, bool is_pain_picture )
######
# Loads single bitmap
# 
# Choose random index in the category.
# Draws pain/no-pain images proportionally to global variable `pain_no_pain_ratio`
# 
# PRIVATE METHOD - SHOULDN'T BE USING DIRECTLY.
######
begin
	bitmap loaded_bitmap;
	out.print_line("Loading bitmap: " + category + " " + gender + " " + "pain: " + string(is_pain_picture));
	if (is_pain_picture) then
		if (category == "white") then
			if (gender == "male") then
				loaded_bitmap = draw_random_bitmap( pain_white_male );
			else
				loaded_bitmap = draw_random_bitmap( pain_white_female );
			end;
		end;
		if (category == "asian") then
			if (gender == "male") then
				loaded_bitmap = draw_random_bitmap( pain_asian_male );
			else
				loaded_bitmap = draw_random_bitmap( pain_asian_female );
			end;
		end;
		if (category == "latin") then
			if (gender == "male") then
				loaded_bitmap = draw_random_bitmap( pain_latin_male );
			else
				loaded_bitmap = draw_random_bitmap( pain_latin_female );
			end;
		end;
		if (category == "black") then
			if (gender == "male") then
				loaded_bitmap = draw_random_bitmap( pain_black_male );
			else
				loaded_bitmap = draw_random_bitmap( pain_black_female );
			end;
		end;
	else
		if (category == "white") then
			if (gender == "male") then
				loaded_bitmap = draw_random_bitmap( neutral_white_male );
			else
				loaded_bitmap = draw_random_bitmap( neutral_white_female );
			end;
		end;
		if (category == "asian") then
			if (gender == "male") then
				loaded_bitmap = draw_random_bitmap( neutral_asian_male );
			else
				loaded_bitmap = draw_random_bitmap( neutral_asian_female );
			end;
		end;
		if (category == "latin") then
			if (gender == "male") then
				loaded_bitmap = draw_random_bitmap( neutral_latin_male );
			else
				loaded_bitmap = draw_random_bitmap( neutral_latin_female );
			end;
		end;
		if (category == "black") then
			if (gender == "male") then
				loaded_bitmap = draw_random_bitmap( neutral_black_male );
			else
				loaded_bitmap = draw_random_bitmap( neutral_black_female );
			end;
		end;
	end;
	return loaded_bitmap;
end;

sub bitmap get_similar_bitmap ( int similarity_index, bool is_pain_picture )
#######
# Return bitmap, where similarity w.r.t subject is rising monotonically 1 being the most similar, and 4 being the least similar.
# 
# 1: same gender, same race
# 2: different gender, same race
# 3: same gender, different race
# 4: different gender, different race
#######
begin
	bitmap chosen_bmp;
	if (similarity_index == 1) then
		chosen_bmp = load_bitmap("white", subject_gender, is_pain_picture);
	end;
	if (similarity_index == 2) then
		if (subject_gender == "male") then
			chosen_bmp = load_bitmap("white", "female", is_pain_picture);
		else
			chosen_bmp = load_bitmap("white", "male", is_pain_picture);
		end;
	end;
	if (similarity_index == 3) then
		string race = category_array[random(2,4)];
		chosen_bmp = load_bitmap(race, subject_gender, is_pain_picture);
	end;
	if (similarity_index == 4) then
		string race = category_array[random(2,4)];
		if (subject_gender == "male") then
			chosen_bmp = load_bitmap(race, "female", is_pain_picture);
		else
			chosen_bmp = load_bitmap(race, "male", is_pain_picture);
		end;
	end;
	
	return chosen_bmp;
end;

sub array<bitmap, 1> create_stimulus_block ( string category, bool is_pain_picture, bool rising )
#######
# creates array of bitmap stimulis.
# 
# Parameters:
#   category  - must be one in [asian, latin, black, white]
#   rising    - similarity index is rising
#
# Returns:
#   array of loaded bitmaps, ready to be unloaded to block.
######
begin
	out.print_line("Entered create_stimulus_block. Time: " + string(clock.time()));
	out.print_line("stimulus_block rising: " + string(rising));
	array<bitmap> bitmap_array[n_pictures_block];
	array<int> similarity_array[n_pictures_block];
	array<string> male_female_id[n_pictures_block];
	
	# Draw random similarity
	int random_similarity = { 1, 2, 3, 4 }[random(1,4)];

	loop int i = 1 until i > n_pictures_block
	begin
		if (is_pain_picture == false) then		
			bitmap_array[i] = get_similar_bitmap( random_similarity, is_pain_picture );
			similarity_array[i] = random_similarity;
		else
			if (i < 3) then
				bitmap_array[i] = get_similar_bitmap( 1, is_pain_picture );
				similarity_array[i] = 1;
			elseif (i < 5) then
				bitmap_array[i] = get_similar_bitmap( 2, is_pain_picture );
				similarity_array[i] = 2;
			elseif (i < 7) then
				bitmap_array[i] = get_similar_bitmap( 3, is_pain_picture );
				similarity_array[i] = 3;
			elseif (i < 9) then
				bitmap_array[i] = get_similar_bitmap( 4, is_pain_picture );
				similarity_array[i] = 4;
			end;	
		end;
		i = i + 1;
	end;
	
	array<bitmap> final_array[n_pictures_block];

	# Reverse array if we have descending order.
	array<bitmap> reversed_array[n_pictures_block];
	array<int> reversed_sim_array[n_pictures_block];

	if (rising == false) then
		loop int j = 1 until j > bitmap_array.count()
		begin
			reversed_array[reversed_array.count() - j + 1] = bitmap_array[j];
			reversed_sim_array[reversed_sim_array.count() - j + 1] = similarity_array[j];
			j = j + 1;
		end;
		final_array = reversed_array;
		final_sim_array = reversed_sim_array;
	else
		final_array = bitmap_array;
		final_sim_array = similarity_array;
	end;
		
	return final_array;
end;

########################################
#
# MAIN
#
########################################

text start_txt = new text();
# Start instruction briefing..
start_txt.set_caption("Task: view images and decide whether person in the image is in pain or not.", true);
start_txt.set_character_wrap_mode(true);
start_txt.set_font_size( 30.0 );
start_txt.set_max_text_width(1870);
start_txt.redraw();
default.clear();
default.add_part(start_txt, 0.0, 0.0);
default.present();
wait_interval(4000);

if (use_button) then
	start_txt.set_caption("When question mark is on screen, press the button if the previous face was in pain. ", true);
	start_txt.set_character_wrap_mode(true);
	default.present();
	wait_interval(5000);
else
	start_txt.set_caption("When question mark is on screen, say out loud \"pain\" or \"not in pain\" ", true);
	start_txt.set_character_wrap_mode(true);
	default.present();
	wait_interval(5000);
end;

start_txt.set_caption("Between images, focus on the black cross. ", true);
default.present();
wait_interval(3000);

start_txt.set_caption("Experiment starting..", true);
default.present();
wait_interval(3000);

# Create fixation cross
default.clear();
default.add_part( horizfix, 0.0, 0.0);
default.add_part( vertfix, 0.0, 0.0 );

loop int m = 1 until m > n_sessions
begin
	out.print_line("Starting session: " + string(m) + ". Time: " + string(clock.time()));
	
	start_experiment.present();
	
	# Start the stimuli
	loop int k = 1 until k > n_blocks
	begin	
		# Randomize our gender, 50/50
		# If value is over 0.5, choose from our 'other' categories
		# Else choose white
		string chosen_category;
		if random() > 0.5 then
			int race_index = random(2,4);
			chosen_category = category_array[race_index];
		else
			chosen_category = category_array[1];
		end;
		
		# Define whether we are using pain picture
		bool is_pain;
		
		if (random() < pain_no_pain_ratio) then
			is_pain = true;
		else
			is_pain = false;
		end;
		
		# Define delta time
		int delta_time = random(isi_min, isi_max);
		out.print_line("Using delta_time: " + string(delta_time) + "ms");
		
		# Define whether stimulus similarity is rising
		bool is_rising;
		double num = random();
		if (num > 0.5) then
			is_rising = true;
		else
			is_rising = false;
		end;
		out.print_line(string(is_rising));
		
		# Define whether to show big question mark
		double n_pictures_presented = 540.0 / (2.3 * double(n_pictures_block)); # (60 seconds * 9 (mins)) / (stimuli + ISI + estimated_error) seconds * (# pics block)
		double prob = 4.0 / n_pictures_presented;
		
		# If we are on first iteration, we dont want question...
		if (k == 1) then
			prob = 0;
		end;
		
		# Show question mark randomly
		if ( random() < prob ) then
			out.print_line("Presenting question");
			text question = new text();
			question.set_caption("?");
			question.set_font_size(70);
			question.redraw();
			
			default.clear();
			default.add_part( question, 0.0, 0.0 );
			
			block.add_stimulus_event( default, 1 );
			stimulus_event event = block.get_stimulus_event( 1 );
			event.set_event_code( "question" );
			event.set_deltat( delta_time ); 
			
			block.set_type(block.FIXED);
			event.set_duration( 3000 );
			
			out.print_line("Presenting stimulus. Time: " + string(clock.time()));
			block.present();
			out.print_line("Presentation done. Time: " + string(clock.time()));
			
			default.clear();
			default.add_part(horizfix, 0.0, 0.0);
			default.add_part(vertfix, 0.0, 0.0);
			default.present();
			block.clear_stimulus_events();
		end;

		out.print_line("Chosen ethnicity is " + chosen_category + ". Pain: " + string(is_pain));
		
		# Choose the properties that we want for this block
		array<bitmap> bmp_array[n_pictures_block] = create_stimulus_block( chosen_category, is_pain, is_rising );
		initialize_stimulus_block( bmp_array, chosen_category, delta_time, is_pain );
	
		out.print_line("Presenting stimulus. Time: " + string(clock.time()));
		block.present();
		out.print_line("Presentation done. Time: " + string(clock.time()));
	
		block.clear_stimulus_events();
	
		loop int j = 1 until j > bmp_array.count()
		begin
			bmp_array[j].unload();
			j = j + 1;
		end;
		
		out.print_line("Stimulus events cleared, bitmaps unloaded");
		out.print_line("");
		
		k = k + 1;
	end;
	
	m = m + 1;
	
	double start_t = clock.time();
	double end_t = start_t + 60000;
	
	if (m < n_sessions + 1) then		
		out.print_line("starting break. Time: " + string(clock.time()));
		text break_txt = new text();
		break_txt.set_font_size(30.0);
		break_txt.set_character_wrap_mode(true);
		break_txt.set_max_text_width(500);
		default.clear();
		default.add_part(break_txt, 0.0, 0.0);
		
		# Wait for approx 60 seconds and start experimenting again
		loop int n = 1 until clock.time() > end_t
		begin
			if (end_t - clock.time() < 10000) then
				break_txt.set_caption("Exercise starting soon..", true);
			else
				break_txt.set_caption("Break for " + string(int((end_t - clock.time()) / 1000)) + " seconds. You can rest your eyes and mind now. ", true);
			end;
			default.set_part(1, break_txt );
			default.present();
			wait_interval(50);
		end;
		default.clear();
		default.add_part(horizfix, 0.0, 0.0);
		default.add_part(vertfix, 0.0, 0.0);
		default.present();
		break_txt.unload();
		
		out.print_line("Ending break. Time: " + string(clock.time()));
	
	end;
	
end;
out.close();