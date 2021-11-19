library('ProjectTemplate')
load.project()

#correlation between video duration and % people watching 100% of video for all runs
e= cor(seven_videos_100[,1], seven_videos_100[,2])
f= cor(five_videos_100[,1], five_videos_100[,2])
g= cor(four_videos_100[,1], four_videos_100[,2])
h=cor(three_videos_100[,1], three_videos_100[,2])
correlations= as.data.frame(c(e,f,g,h))

#GRAPH 1: scatterplot for video duration and % of people who watched 100% (all runs)
ggplot(data= bind_rows(data_list_100)) +
  geom_point(data= seven_videos_100, aes(x=video_duration, y= viewed_onehundred_percent, col="Run 7"), alpha= 1) +
  geom_point(data= five_videos_100, aes(x=video_duration, y= viewed_onehundred_percent, col="Run 5"), alpha= 1) + 
  geom_point(data= four_videos_100, aes(x=video_duration, y= viewed_onehundred_percent, col="Run 4"), alpha= 1) +
  geom_point(data= three_videos_100, aes(x=video_duration, y= viewed_onehundred_percent, col="Run 3"), alpha= 1) +
  labs(x= "Video Duration (seconds)", y= "Percentage of people who viewed 100% of the video") +
  scale_colour_discrete(name = "Run Number")

#GRAPH 2: scatterplot of video duration and views, split by view %
ggplot(data= bind_rows(view_percentages_total_duration)) + 
  geom_point(data= view_percentages_100_duration, aes(x=video_duration, y= viewed_onehundred_percent, col="g. 100% of the video watched"), alpha= 1) +
  geom_point(data= view_percentages_95_duration, aes(x=video_duration, y= viewed_ninetyfive_percent, col="f. 95% of the video watched"), alpha= 1) + 
  geom_point(data= view_percentages_75_duration, aes(x=video_duration, y= viewed_seventyfive_percent, col="e. 75% of the video watched"), alpha= 1) +
  geom_point(data= view_percentages_50_duration, aes(x=video_duration, y= viewed_fifty_percent, col="d. 50% of the video watched"), alpha= 1) +
  geom_point(data= view_percentages_25_duration, aes(x=video_duration, y= viewed_twentyfive_percent, col="c. 25% of the video watched"), alpha= 1) +
  geom_point(data= view_percentages_10_duration, aes(x=video_duration, y= viewed_ten_percent, col="b. 10% of the video watched"), alpha= 1) +
  geom_point(data= view_percentages_5_duration, aes(x=video_duration, y= viewed_five_percent, col="a. 5% of the video watched"), alpha= 1) + 
  labs(x= "Video Duration (seconds)", y= "View percentage", title= "Scatterplot of video duration and views, split by view %") + theme(legend.title = element_blank())

#GRAPH 3: scatterplot of video number and views, split by view %
ggplot(data= bind_rows(view_percentages_step_position)) + 
  geom_point(data= view_percentages_100_step_position, aes(x=as.numeric(as.factor(step_position)), y= viewed_onehundred_percent, col="g. 100% of the video watched"), alpha= 1) +
  geom_point(data= view_percentages_95_step_position, aes(x=as.numeric(as.factor(step_position)), y= viewed_ninetyfive_percent, col="f. 95% of the video watched"), alpha= 1) + 
  geom_point(data= view_percentages_75_step_position, aes(x=as.numeric(as.factor(step_position)), y= viewed_seventyfive_percent, col="e. 75% of the video watched"), alpha= 1) +
  geom_point(data= view_percentages_50_step_position, aes(x=as.numeric(as.factor(step_position)), y= viewed_fifty_percent, col="d. 50% of the video watched"), alpha= 1) +
  geom_point(data= view_percentages_25_step_position, aes(x=as.numeric(as.factor(step_position)), y= viewed_twentyfive_percent, col="c. 25% of the video watched"), alpha= 1) +
  geom_point(data= view_percentages_10_step_position, aes(x=as.numeric(as.factor(step_position)), y= viewed_ten_percent, col="b. 10% of the video watched"), alpha= 1) +
  geom_point(data= view_percentages_5_step_position, aes(x=as.numeric(as.factor(step_position)), y= viewed_five_percent, col="a. 5% of the video watched"), alpha= 1) + 
  labs(x= "Video Number", y= "View percentage", title= "Scatterplot of video number and views, split by view %") + theme(legend.title = element_blank()) +
  geom_vline(xintercept= 5.5) + geom_vline(xintercept= 9.5) + geom_text(aes(x=2.75, label= "Week 1", y= 90)) + geom_text(aes(x=7.5, label= "Week 2", y= 90))+ geom_text(aes(x=11.5, label= "Week 3", y= 90))


#GRAPH 4: scatterplot of differences in people watching 100% at start and end of each week against mean duration of time
ggplot(data= duration_differences, aes(x=duration_differences[,1], y= viewed_onehundred_percent)) + geom_line() +
  labs(x= "Duration", y="Percentage decrease of people watching full video", title= "Scatterplot of duration and percentage change in people watching the full video")

#GRAPH 5: line graph for each video's durations at each % and amount of people watching
ggplot(data= video_stats, aes(x=X1, y= X2)) + geom_line(aes(colour= Video)) 

#identify range of percentages
range(video_stats$X2)
#which video is least watched to the full 
which.min(video_stats$X2)


