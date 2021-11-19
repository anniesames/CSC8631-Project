# Example preprocessing script.
#PREPROCESSING 
#select video durations and view % for runs 3, 4, 5 and 7
library(dplyr)
library(tidyr)
load.project()

#select only relevant video duration and 100% view columns in runs 3,4,5 and 7
seven_videos_100= select(cyber.security.7_video.stats, video_duration, viewed_onehundred_percent)
five_videos_100= select(cyber.security.5_video.stats, video_duration, viewed_onehundred_percent)
four_videos_100= select(cyber.security.4_video.stats, video_duration, viewed_onehundred_percent)
three_videos_100= select(cyber.security.3_video.stats, video_duration, viewed_onehundred_percent)

#make list fof stats for all runs
data_list_100= list(seven_videos_100, five_videos_100, four_videos_100, three_videos_100)

seven_info= select(cyber.security.7_video.stats, step_position, video_duration, viewed_five_percent, viewed_ten_percent,
                   viewed_twentyfive_percent, viewed_fifty_percent, viewed_seventyfive_percent, viewed_ninetyfive_percent, viewed_onehundred_percent)

#select only relevant video duration and view% columns (run 7 only)
view_percentages_100_duration= select(cyber.security.7_video.stats, video_duration, viewed_onehundred_percent)
view_percentages_95_duration= select(cyber.security.7_video.stats, video_duration, viewed_ninetyfive_percent)
view_percentages_75_duration= select(cyber.security.7_video.stats, video_duration, viewed_seventyfive_percent)
view_percentages_50_duration= select(cyber.security.7_video.stats, video_duration, viewed_fifty_percent)
view_percentages_25_duration= select(cyber.security.7_video.stats, video_duration, viewed_twentyfive_percent)
view_percentages_10_duration= select(cyber.security.7_video.stats, video_duration, viewed_ten_percent)
view_percentages_5_duration= select(cyber.security.7_video.stats, video_duration, viewed_five_percent)
#make list of durations
view_percentages_total_duration= list(view_percentages_100_duration, view_percentages_95_duration, view_percentages_75_duration, view_percentages_50_duration, view_percentages_25_duration, view_percentages_10_duration, view_percentages_5_duration)

durations= select(seven_info, video_duration, viewed_five_percent, viewed_ten_percent,
                  viewed_twentyfive_percent, viewed_fifty_percent, viewed_seventyfive_percent, viewed_ninetyfive_percent, viewed_onehundred_percent)

durations= durations%>%as.numeric(video_duration)
durations= durations%>%pivot_longer(!durations, names_to= "video_percentage_viewed", values_to= "% People watching")

#select only relevant video number and view% columns (run 7)
view_percentages_100_step_position= select(cyber.security.7_video.stats, step_position, viewed_onehundred_percent)
view_percentages_95_step_position= select(cyber.security.7_video.stats, step_position, viewed_ninetyfive_percent)
view_percentages_75_step_position= select(cyber.security.7_video.stats, step_position, viewed_seventyfive_percent)
view_percentages_50_step_position= select(cyber.security.7_video.stats, step_position, viewed_fifty_percent)
view_percentages_25_step_position= select(cyber.security.7_video.stats, step_position, viewed_twentyfive_percent)
view_percentages_10_step_position= select(cyber.security.7_video.stats, step_position, viewed_ten_percent)
view_percentages_5_step_position= select(cyber.security.7_video.stats, step_position, viewed_five_percent)
#make list of video numbers
view_percentages_step_position= list(view_percentages_100_step_position, view_percentages_95_step_position, view_percentages_75_step_position, view_percentages_50_step_position, view_percentages_25_step_position, view_percentages_10_step_position, view_percentages_5_step_position)

video_numbers= select(seven_info, step_position, viewed_five_percent, viewed_ten_percent,
                      viewed_twentyfive_percent, viewed_fifty_percent, viewed_seventyfive_percent, viewed_ninetyfive_percent, viewed_onehundred_percent)
video_numbers= video_numbers%>%as.data.frame(pivot_longer(!step_position, names_to= "view", values_to= "% People watched"))
video_numbers


#percentage change in people watching 100% from start to end of week 
(diff_week1= ((view_percentages_100_step_position[5,2]- view_percentages_100_step_position[1,2] )/view_percentages_100_step_position[1,2])*100)
(diff_week2= ((view_percentages_100_step_position[9,2]- view_percentages_100_step_position[6,2])/view_percentages_100_step_position[6,2])*100)
(diff_week3= ((view_percentages_100_step_position[13,2]- view_percentages_100_step_position[10,2])/view_percentages_100_step_position[10,2])*100)
differences= bind_rows(diff_week1, diff_week2, diff_week3)
rownames(differences)= c('Week 1','Week 2','Week 3')

#separate videos by week
week1_videos= seven_info[1:5,]
week2_videos= seven_info[6:9,]
week3_videos= seven_info[10:13,]

#mean durations of video by week
mean_duration_w1= mean(week1_videos$video_duration)
mean_duration_w2= mean(week2_videos$video_duration)
mean_duration_w3= mean(week3_videos$video_duration)
durations= data.frame(c(mean_duration_w1, mean_duration_w2, mean_duration_w3))
duration_differences= cbind(durations, differences)

average_100_w1= mean(week1_videos$viewed_onehundred_percent)
average_100_w2= mean(week2_videos$viewed_onehundred_percent)
average_100_w3= mean(week3_videos$viewed_onehundred_percent)

average_5_w1= mean(week1_videos$viewed_five_percent)
average_5_w2= mean(week2_videos$viewed_five_percent)
average_5_w3= mean(week3_videos$viewed_five_percent)

duration_info= select(seven_info, video_duration, viewed_five_percent, viewed_ten_percent,
                      viewed_twentyfive_percent, viewed_fifty_percent, viewed_seventyfive_percent, viewed_ninetyfive_percent, viewed_onehundred_percent)

five_percent_durations= 0.05*duration_info[,1]
ten_percent_durations= 0.1*duration_info[,1]
twenty_five_percent_durations= 0.25*duration_info[,1]
fifty_percent_durations= 0.5*duration_info[,1]
seventyfive_percent_durations= 0.75*duration_info[,1]
ninetyfive_percent_durations= 0.95*duration_info[,1]
hundred_percent_durations= duration_info[,1]

vid_durations= cbind(five_percent_durations, ten_percent_durations,twenty_five_percent_durations, fifty_percent_durations, seventyfive_percent_durations, ninetyfive_percent_durations, hundred_percent_durations)
vid_views= as.data.frame(seven_info[,3:9])

(video1_durations= rbind(vid_durations[1,1], vid_durations[1,2], vid_durations[1,3],
                         vid_durations[1,4], vid_durations[1,5], vid_durations[1,6],
                         vid_durations[1,7]))
(video1_views= rbind(vid_views[1,1], vid_views[1,2], vid_views[1,3], vid_views[1,4], vid_views[1,5],
                     vid_views[1,6], vid_views[1,7]))

video1_stats= data.frame(cbind(video1_durations, video1_views))

#VIDEO 2
(video2_durations= rbind(vid_durations[2,1], vid_durations[2,2], vid_durations[2,3],
                         vid_durations[2,4], vid_durations[2,5], vid_durations[2,6],
                         vid_durations[2,7]))
(video2_views= rbind(vid_views[2,1], vid_views[2,2], vid_views[2,3], vid_views[2,4], vid_views[2,5],
                     vid_views[2,6], vid_views[2,7]))

video2_stats= data.frame(cbind(video2_durations, video2_views))

#VIDEO 3
(video3_durations= rbind(vid_durations[3,1], vid_durations[3,2], vid_durations[3,3],
                         vid_durations[3,4], vid_durations[3,5], vid_durations[3,6],
                         vid_durations[3,7]))
(video3_views= rbind(vid_views[3,1], vid_views[3,2], vid_views[3,3], vid_views[3,4], vid_views[3,5],
                     vid_views[3,6], vid_views[3,7]))

video3_stats= data.frame(cbind(video3_durations, video3_views))

#VIDEO 4
(video4_durations= rbind(vid_durations[4,1], vid_durations[4,2], vid_durations[4,3],
                         vid_durations[4,4], vid_durations[4,5], vid_durations[4,6],
                         vid_durations[4,7]))
(video4_views= rbind(vid_views[4,1], vid_views[4,2], vid_views[4,3], vid_views[4,4], vid_views[4,5],
                     vid_views[4,6], vid_views[4,7]))

video4_stats= data.frame(cbind(video4_durations, video4_views))

#VIDEO 5
(video5_durations= rbind(vid_durations[5,1], vid_durations[5,2], vid_durations[5,3],
                         vid_durations[5,4], vid_durations[5,5], vid_durations[5,6],
                         vid_durations[5,7]))
(video5_views= rbind(vid_views[5,1], vid_views[5,2], vid_views[5,3], vid_views[5,4], vid_views[5,5],
                     vid_views[5,6], vid_views[5,7]))

video5_stats= data.frame(cbind(video5_durations, video5_views))

#VIDEO 6
(video6_durations= rbind(vid_durations[6,1], vid_durations[6,2], vid_durations[6,3],
                         vid_durations[6,4], vid_durations[6,5], vid_durations[6,6],
                         vid_durations[6,7]))
(video6_views= rbind(vid_views[6,1], vid_views[6,2], vid_views[6,3], vid_views[6,4], vid_views[6,5],
                     vid_views[6,6], vid_views[6,7]))

video6_stats= data.frame(cbind(video6_durations, video6_views))

#VIDEO 7 
(video7_durations= rbind(vid_durations[7,1], vid_durations[7,2], vid_durations[7,3],
                         vid_durations[7,4], vid_durations[7,5], vid_durations[7,6],
                         vid_durations[7,7]))
(video7_views= rbind(vid_views[7,1], vid_views[7,2], vid_views[7,3], vid_views[7,4], vid_views[7,5],
                     vid_views[7,6], vid_views[7,7]))

video7_stats= data.frame(cbind(video7_durations, video7_views))

#VIDEO 8
(video8_durations= rbind(vid_durations[8,1], vid_durations[8,2], vid_durations[8,3],
                         vid_durations[8,4], vid_durations[8,5], vid_durations[8,6],
                         vid_durations[8,7]))
(video8_views= rbind(vid_views[8,1], vid_views[8,2], vid_views[8,3], vid_views[8,4], vid_views[8,5],
                     vid_views[8,6], vid_views[8,7]))

video8_stats= data.frame(cbind(video8_durations, video8_views))

#VIDEO 9
(video9_durations= rbind(vid_durations[9,1], vid_durations[9,2], vid_durations[9,3],
                         vid_durations[9,4], vid_durations[9,5], vid_durations[9,6],
                         vid_durations[9,7]))
(video9_views= rbind(vid_views[9,1], vid_views[9,2], vid_views[9,3], vid_views[9,4], vid_views[9,5],
                     vid_views[9,6], vid_views[9,7]))

video9_stats= data.frame(cbind(video9_durations, video9_views))

#VIDEO 10
(video10_durations= rbind(vid_durations[10,1], vid_durations[10,2], vid_durations[10,3],
                          vid_durations[10,4], vid_durations[10,5], vid_durations[10,6],
                          vid_durations[10,7]))
(video10_views= rbind(vid_views[10,1], vid_views[10,2], vid_views[10,3], vid_views[10,4], vid_views[10,5],
                      vid_views[10,6], vid_views[10,7]))

video10_stats= data.frame(cbind(video10_durations, video10_views))

#VIDEO 11
(video11_durations= rbind(vid_durations[11,1], vid_durations[11,2], vid_durations[11,3],
                          vid_durations[11,4], vid_durations[11,5], vid_durations[11,6],
                          vid_durations[11,7]))
(video11_views= rbind(vid_views[11,1], vid_views[11,2], vid_views[11,3], vid_views[11,4], vid_views[11,5],
                      vid_views[11,6], vid_views[11,7]))

video11_stats= data.frame(cbind(video11_durations, video11_views))

#VIDEO 12
(video12_durations= rbind(vid_durations[12,1], vid_durations[12,2], vid_durations[12,3],
                          vid_durations[12,4], vid_durations[12,5], vid_durations[12,6],
                          vid_durations[12,7]))
(video12_views= rbind(vid_views[12,1], vid_views[12,2], vid_views[12,3], vid_views[12,4], vid_views[12,5],
                      vid_views[12,6], vid_views[12,7]))

video12_stats= data.frame(cbind(video12_durations, video12_views))

#VIDEO 13
(video13_durations= rbind(vid_durations[13,1], vid_durations[13,2], vid_durations[13,3],
                          vid_durations[13,4], vid_durations[13,5], vid_durations[13,6],
                          vid_durations[13,7]))
(video13_views= rbind(vid_views[13,1], vid_views[13,2], vid_views[13,3], vid_views[13,4], vid_views[13,5],
                      vid_views[13,6], vid_views[13,7]))

video13_stats= data.frame(cbind(video13_durations, video13_views))

video1_stats$Video = "Video1"
video2_stats$Video = "Video2"
video3_stats$Video = "Video3"
video4_stats$Video = "Video4"
video5_stats$Video = "Video5"
video6_stats$Video = "Video6"
video7_stats$Video = "Video7"
video8_stats$Video = "Video8"
video9_stats$Video = "Video9"
video10_stats$Video = "Video10"
video11_stats$Video = "Video11"
video12_stats$Video = "Video12"
video13_stats$Video = "Video13"

video_stats= as.data.frame(rbind(video1_stats, video2_stats, video3_stats, video4_stats, video5_stats, video6_stats,
                                 video7_stats, video8_stats, video9_stats, video10_stats, video11_stats, video12_stats,
                                 video13_stats))
video_stats$Video= factor(video_stats$Video, levels= c("Video1", "Video2", "Video3", "Video4", "Video5", "Video6",
                                                       "Video7", "Video8", "Video9", "Video10", "Video11", "Video12",
                                                       "Video13"))

transcripts= cyber.security.7_video.stats$total_transcript_views
mean(transcripts[1:5])
mean(transcripts[6:9])
mean(transcripts[10:13])


bp= bind_cols(view_percentages_total_duration)

bp2= select(bp, video_duration...1, viewed_five_percent, viewed_ten_percent,
            +                   viewed_twentyfive_percent, viewed_fifty_percent, viewed_seventyfive_percent, viewed_ninetyfive_percent, viewed_onehundred_percent)
bp2%>%pivot_longer(!video_duration, names_to= "vid")
