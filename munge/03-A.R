#CYCLE 3
#Select duration percentages and total duration of each video
duration_info= select(seven_info, video_duration, viewed_five_percent, viewed_ten_percent,
                      viewed_twentyfive_percent, viewed_fifty_percent, viewed_seventyfive_percent, viewed_ninetyfive_percent, viewed_onehundred_percent)

#Calculate %s of each duration
five_percent_durations= 0.05*duration_info[,1]
ten_percent_durations= 0.1*duration_info[,1]
twenty_five_percent_durations= 0.25*duration_info[,1]
fifty_percent_durations= 0.5*duration_info[,1]
seventyfive_percent_durations= 0.75*duration_info[,1]
ninetyfive_percent_durations= 0.95*duration_info[,1]
hundred_percent_durations= duration_info[,1]

#combines exact duration times
vid_durations= cbind(five_percent_durations, ten_percent_durations,twenty_five_percent_durations, fifty_percent_durations, seventyfive_percent_durations, ninetyfive_percent_durations, hundred_percent_durations)
vid_views= as.data.frame(seven_info[,4:10])

#Make dataframe for each video with raw durations and views at each 
#VIDEO 1
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

#Assign video numbers to each video
video1_stats$Video = "Video 1"
video2_stats$Video = "Video 2"
video3_stats$Video = "Video 3"
video4_stats$Video = "Video 4"
video5_stats$Video = "Video 5"
video6_stats$Video = "Video 6"
video7_stats$Video = "Video 7"
video8_stats$Video = "Video 8"
video9_stats$Video = "Video 9"
video10_stats$Video = "Video 10"
video11_stats$Video = "Video 11"
video12_stats$Video = "Video 12"
video13_stats$Video = "Video 13"

video_stats= as.data.frame(rbind(video1_stats, video2_stats, video3_stats, video4_stats, video5_stats, video6_stats,
                                 video7_stats, video8_stats, video9_stats, video10_stats, video11_stats, video12_stats,
                                 video13_stats))
video_stats$Video= factor(video_stats$Video, levels= c("Video 1", "Video 2", "Video 3", "Video 4", "Video 5", "Video 6",
                                                       "Video 7", "Video 8", "Video 9", "Video 10", "Video 11", "Video 12",
                                                       "Video 13"))