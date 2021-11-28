#PREPROCESSING 
library(ProjectTemplate)

#Select only relevant information from run 7 stats file
seven_info= select(cyber.security.7_video.stats, step_position, total_views, video_duration, viewed_five_percent, viewed_ten_percent,
                   viewed_twentyfive_percent, viewed_fifty_percent, viewed_seventyfive_percent, viewed_ninetyfive_percent, viewed_onehundred_percent)

#convert step positions to vid numbers 1-13
seven_info$step_position = as.character(seven_info$step_position)
seven_info$step_position[seven_info$step_position == "1.1"] = "1"
seven_info$step_position[seven_info$step_position == "1.14"] = "2"
seven_info$step_position[seven_info$step_position == "1.17"] = "3"
seven_info$step_position[seven_info$step_position == "1.19"] = "4"
seven_info$step_position[seven_info$step_position == "1.5"] = "5"
seven_info$step_position[seven_info$step_position == "2.1"] = "6"
seven_info$step_position[seven_info$step_position == "2.11"] = "7"
seven_info$step_position[seven_info$step_position == "2.17"] = "8"
seven_info$step_position[seven_info$step_position == "2.4"] = "9"
seven_info$step_position[seven_info$step_position == "3.1"] = "10"
seven_info$step_position[seven_info$step_position == "3.14"] = "11"
seven_info$step_position[seven_info$step_position == "3.15"] = "12"
seven_info$step_position[seven_info$step_position == "3.2"] = "13"

#select duration & views from runs 3,4,5
five_info= select(cyber.security.5_video.stats, video_duration, viewed_onehundred_percent)
four_info= select(cyber.security.4_video.stats, video_duration, viewed_onehundred_percent)
three_info= select(cyber.security.3_video.stats, video_duration, viewed_onehundred_percent)
#Select video durations and 100% view % for runs 3, 4, 5 and 7
seven_videos_100= select(seven_info, video_duration, viewed_onehundred_percent)
#make list of 100% views for all runs
data_list_100= list(seven_videos_100, five_info, four_info, three_info)

#table of durations, views and view%
dur_tot_view= as.data.frame(select(seven_info, video_duration, total_views, viewed_onehundred_percent))
colnames(dur_tot_view)= c("Video Duration", "Total Views", "% of People Watching Full Video")

#CYCLE 1
#select only relevant video duration and view% columns (run 7 only)
viewed_100_dur= select(seven_info, video_duration, viewed_onehundred_percent)
viewed_95_dur= select(seven_info, video_duration, viewed_ninetyfive_percent)
viewed_75_dur= select(seven_info, video_duration, viewed_seventyfive_percent)
viewed_50_dur= select(seven_info, video_duration, viewed_fifty_percent)
viewed_25_dur= select(seven_info, video_duration, viewed_twentyfive_percent)
viewed_10_dur= select(seven_info, video_duration, viewed_ten_percent)
viewed_5_dur= select(seven_info, video_duration, viewed_five_percent)
#make list of durations
view_percentages_total_duration= list(viewed_100_dur, viewed_95_dur, viewed_75_dur, viewed_50_dur, viewed_25_dur, viewed_10_dur, viewed_5_dur)
      




