# usage:
# Rscript create_surveys.R

library(dplyr, warn.conflicts = FALSE)
library(readr)
library(stringr)

d1 <- read_csv('raw/Course-feedback-overall.csv', col_types = cols()) %>% 
  mutate(year = 2017)
d2 <- read_csv('raw/EEB313 Overall Course Feedback.csv', col_types = cols()) %>% 
  mutate(year = 2018)

surveys <- bind_rows(d1, d2) %>% 
  mutate(date = str_replace(
    Timestamp, ' [0-9]{1,}:[0-9]{2}:[0-9]{2} [AP]M EST', '')
  ) %>%
  mutate(date = as.Date(date)) %>% 
  select(-Timestamp) %>% 
  mutate_if(is.character, funs(str_replace_all(., '\n', ''))) %>%  # remove newlines
  select(year, date, everything()) %>% # reorder columns
  rename(
    overall_lecture_rating = `How would you rate the course *lecture* material overall?`,
    material_improvements = `How can the course material be improved (for example, the pacing, structure, content, concepts, and/or challenges)?`,
    student_instructor_ratio = `The ratio of instructors to students was:`,
    overall_instructor_rating = `How would you rate the instructors overall?`,
    instructor_improvements = `What can the instructors improve upon?`,
    proj_rating = `How would you rate the final project?`,
    proj_improvements = `How could the final project be improved?`,
    diffs_project = `Which were the biggest differences between the final project in this class and your previous undergraduate group projects?`,
    lecture_proj_prep = `Did the lectures prepare you adequately for the final project?`,
    material_relevance = `How relevant do you think the concepts discussed during class will be for your future work/studies?`,
    relative_effort = `Did you need to spend more or less time and effort on this course than on other courses?`,
    overall_improvements = `Is there anything specific we could do to help make this course better for future semesters?`,
    fav_thing = `What did you enjoy the most about the course and why?`,
    course_specific_skills = `Were there any skills that you developed more in this course compared to your previous courses? If so, which ones?`,
    not_covered = `Was there anything you had hoped/expected to learn starting out in this course that we did not cover?`,
    would_recommend = `Would you recommend this course to a friend?`,
    overall_rating = `How would you rate the course overall?`
  )
  
surveys_quantitative <- surveys %>% 
  select_if(function(x) is.numeric(x))

write_csv(surveys, 'course-surveys.csv')
write_csv(surveys_quantitative, 'course-surveys-quantitative.csv')

