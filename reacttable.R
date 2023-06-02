reactable(
# Drop-down table made in React
# Drill-down tables let you pack a lot of data in a compact manner and allow use by multiple audiences interested in varying degrees/levels of information. reactable can help create an interactive data table from tabular data with sorting and pagination by default. The data table is an HTML widget that can be used in R Markdown documents and Shiny applications, or viewed from an R console. A lot of features can be enabled/disabled using the basic arguments of the reactable() function and much more using custom JavaScript.

  data       = top_level,
  compact    = TRUE, # for minimum row height
  filterable = TRUE, # for individual column filters
  striped    = TRUE, # banded rows
  resizable  = TRUE, # for resizable column widths
  columns    = list(
    course_id   = colDef(name = "CID",             width = 50,  align = "center"),
    course_name = colDef(name = "Course Name"), 
    start_date  = colDef(name = "Start Date",      width = 120, align = "center"),
    end_date    = colDef(name = "End Date",        width = 120, align = "center"),
    n_students  = colDef(name = "No. of Students", width = 130, align = "center")
  ),
  details = function(index) { # index is the row number of current row.
    # sub-table of only those students for current row.
    sec_lvl = second_level[second_level$course_id == top_level$course_id[index], ] 
    reactable(data       = sec_lvl,
              compact    = TRUE, 
              filterable = TRUE,
              bordered   = TRUE, 
              resizable  = TRUE,
              columns    = list(
                course_id   = colDef(show = FALSE), # hide the course id column
                s_id        = colDef(name = "SID",    width = 70, align = "center"),
                s_name      = colDef(name = "Student Name"),
                gender      = colDef(name = "Gender", width = 90, align = "center"),
                age         = colDef(name = "Age",    width = 50, align = "center")
              )
              )
  }
)
