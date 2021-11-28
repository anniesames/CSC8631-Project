#CYCLE 2                         
#select only relevant video number and view% columns (run 7)
view_percentages_100_step_position= select(seven_info, step_position, viewed_onehundred_percent)
view_percentages_95_step_position= select(seven_info, step_position, viewed_ninetyfive_percent)
view_percentages_75_step_position= select(seven_info, step_position, viewed_seventyfive_percent)
view_percentages_50_step_position= select(seven_info, step_position, viewed_fifty_percent)
view_percentages_25_step_position= select(seven_info, step_position, viewed_twentyfive_percent)
view_percentages_10_step_position= select(seven_info, step_position, viewed_ten_percent)
view_percentages_5_step_position= select(seven_info, step_position, viewed_five_percent)
#make list of video numbers and view %
view_percentages_step_position= list(view_percentages_100_step_position, view_percentages_95_step_position, view_percentages_75_step_position, view_percentages_50_step_position, view_percentages_25_step_position, view_percentages_10_step_position, view_percentages_5_step_position)

#percentage change in people watching 100% from start to end of week 
(diff_week1= ((view_percentages_100_step_position[5,2]- view_percentages_100_step_position[1,2] )/view_percentages_100_step_position[1,2])*100)
(diff_week2= ((view_percentages_100_step_position[9,2]- view_percentages_100_step_position[6,2])/view_percentages_100_step_position[6,2])*100)
(diff_week3= ((view_percentages_100_step_position[13,2]- view_percentages_100_step_position[10,2])/view_percentages_100_step_position[10,2])*100)
differences= bind_rows(diff_week1, diff_week2, diff_week3)
rownames(differences)= c('Week 1','Week 2','Week 3')
colnames(differences)= c("% Change in people watching full video at start and end of week")

#separate videos by week
week1_videos= seven_info[1:5,]
week2_videos= seven_info[6:9,]
week3_videos= seven_info[10:13,]
vid_number_per_week = data.frame(c(nrow(week1_videos), nrow(week2_videos), nrow(week3_videos)))
colnames(vid_number_per_week)= c("Number of Videos per week")

#mean durations of video by week
mean_duration_w1= mean(week1_videos$video_duration)
mean_duration_w2= mean(week2_videos$video_duration)
mean_duration_w3= mean(week3_videos$video_duration)
durations= data.frame(c(mean_duration_w1, mean_duration_w2, mean_duration_w3))
colnames(durations) = c("Mean duration (seconds)")

duration_differences= cbind(durations, differences)

step_number_differences= cbind(vid_number_per_week, durations, differences)



average_100_w1= mean(week1_videos$viewed_onehundred_percent)
average_100_w2= mean(week2_videos$viewed_onehundred_percent)
average_100_w3= mean(week3_videos$viewed_onehundred_percent)

average_5_w1= mean(week1_videos$viewed_five_percent)
average_5_w2= mean(week2_videos$viewed_five_percent)
average_5_w3= mean(week3_videos$viewed_five_percent)

