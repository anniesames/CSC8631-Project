library('ProjectTemplate')
load.project

#Correlation between video duration and % people watching 100% of video for all runs
seven= cor(seven_videos_100[,1], seven_videos_100[,2])
five= cor(five_info[,1], five_info[,2])
four= cor(four_info[,1], four_info[,2])
three=cor(three_info[,1], three_info[,2])
correlations= as.data.frame(c(three, four, five, seven))
colnames(correlations)= c("Correlation")
rownames(correlations)= c("Run 3", "Run 4", "Run 5", "Run 7")

#GRAPH 1: scatterplot for video duration and % of people who watched 100% (all runs)
graph1= ggplot(data= bind_rows(data_list_100)) +
  geom_point(data= seven_videos_100, aes(x=video_duration, y= viewed_onehundred_percent, col="Run 7"), alpha= 1) +
  geom_point(data= five_info, aes(x=video_duration, y= viewed_onehundred_percent, col="Run 5"), alpha= 1) + 
  geom_point(data= four_info, aes(x=video_duration, y= viewed_onehundred_percent, col="Run 4"), alpha= 1) +
  geom_point(data= three_info, aes(x=video_duration, y= viewed_onehundred_percent, col="Run 3"), alpha= 1) +
  labs(x= "Video Duration (seconds)", y= "Percentage of people on course watching 100% of the video", title= "Scattergraph of video duration against the percentage of people watching the full video, split by run number") +
  scale_colour_discrete(name = "Run Number")

#Table for videos and video number
table_views_vid= data.frame(seven_info$step_position, seven_info$total_views)
colnames(table_views_vid)= c("Video Number", "Total Views")

#GRAPH 2: scatterplot of video duration and views, split by view %
graph2= ggplot(data= bind_rows(view_percentages_total_duration)) + 
  geom_line(data= viewed_100_dur, aes(x=video_duration, y= viewed_onehundred_percent, col="g. 100% of the video watched")) +
  geom_line(data= viewed_95_dur, aes(x=video_duration, y= viewed_ninetyfive_percent, col="f. 95% of the video watched")) + 
  geom_line(data= viewed_75_dur, aes(x=video_duration, y= viewed_seventyfive_percent, col="e. 75% of the video watched")) +
  geom_line(data= viewed_50_dur, aes(x=video_duration, y= viewed_fifty_percent, col="d. 50% of the video watched")) +
  geom_line(data= viewed_25_dur, aes(x=video_duration, y= viewed_twentyfive_percent, col="c. 25% of the video watched")) +
  geom_line(data= viewed_10_dur, aes(x=video_duration, y= viewed_ten_percent, col="b. 10% of the video watched")) +
  geom_line(data= viewed_5_dur, aes(x=video_duration, y= viewed_five_percent, col="a. 5% of the video watched")) + 
  labs(x= "Video Duration (seconds)", y= "Percentage of people on course watching video", title= "Scatterplot of video duration and views, split by view %") + 
  theme(legend.title = element_blank())

#GRAPH 3: scatterplot of video number and views, split by view %
graph3= ggplot(data= bind_rows(view_percentages_step_position)) + 
  geom_point(data= view_percentages_100_step_position, aes(x=as.numeric(step_position), y= viewed_onehundred_percent, col="g. 100% of the video watched")) +
  geom_point(data= view_percentages_95_step_position, aes(x=as.numeric(step_position), y= viewed_ninetyfive_percent, col="f. 95% of the video watched")) +
  geom_point(data= view_percentages_75_step_position, aes(x=as.numeric(step_position), y= viewed_seventyfive_percent, col="e. 75% of the video watched")) +
  geom_point(data= view_percentages_50_step_position, aes(x=as.numeric(step_position), y= viewed_fifty_percent, col="d. 50% of the video watched")) +
  geom_point(data= view_percentages_25_step_position, aes(x=as.numeric(step_position), y= viewed_twentyfive_percent, col="c. 25% of the video watched")) +
  geom_point(data= view_percentages_10_step_position, aes(x=as.numeric(step_position), y= viewed_ten_percent, col="b. 10% of the video watched")) +
  geom_point(data= view_percentages_5_step_position, aes(x=as.numeric(step_position), y= viewed_five_percent, col="a. 5% of the video watched")) + labs(x= "Video Number", y= "Percentage of people on course watching video", title= "Scatterplot of video number and views, split by view %") + theme(legend.title = element_blank()) +
  geom_vline(xintercept= 5.5) + geom_vline(xintercept= 9.5) + geom_text(aes(x=2.75, label= "Week 1", y= 90)) + geom_text(aes(x=7.5, label= "Week 2", y= 90))+ geom_text(aes(x=11.5, label= "Week 3", y= 90))

#GRAPH 4: line graph for each video's durations at each % and amount of people watching
(graph4= ggplot(data= video_stats, aes(x=X1, y= X2, colour= Video)) + geom_line() +
    labs(x= "Duration (seconds)", y="Percentage of people watching video", title= "Scatterplot of duration against people watching the videos and where they stop watching"))

#identify range of percentages
range(video_stats$X2)
#which video is least watched to the full 
which.min(video_stats$X2)


