# module-4
Homework #4 R Programming
<!-- wp:heading {"textAlign":"center","level":4} -->
<h4 class="has-text-align-center" id="the-assignment">The Assignment</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p><em>The following data was collected by the local hospital. This data set contains 5 variables based on observation of 8 patients. In addition to the measurements of the patients checking in to the hospital that night, this data provides the patients' histories regarding the frequency of their visits to the hospital in the last 12 months.<br>This data displays the measurement of blood pressure, first assessment by general doctor (bad=1, good =0) titled "first," the second assessment by external doctor (called "second"), and the last row provides the head of the emergency unit's decision regarding immediate care for the patient based on the values 0 or 1 (low = 0, high =1).<br>The names of your variables are as follows: "Freq","bloodp","first”, " second”, ”finaldecision”</em></p>
<!-- /wp:paragraph -->

<!-- wp:heading {"textAlign":"center","level":4} -->
<h4 class="has-text-align-center" id="the-work">The Work</h4>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>First step is to get the data given for the assignment into something useable by R. To accomplish this I copied the data into a basic spreadsheet editor and used the function text-to-columns.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Why would I do this here instead of programmatically? The case here is pragmatism. In a career in the data world, very rarely are you going to be given raw text that needs to be assimilated into a flat file. You will be working on flat files either JSON, Excel, CSV, or most likely direct extracts of SQL queries from databases.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Understand there are use cases where you will be writing code to scrape raw, unstructured data from sources like the internet. That example and the data from the assignment both can easily be handled in R but since the bounds of the assignment do not include that sort of data transformation. We are able to accomplish a simple file to be imported into R for our base.</p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":435,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://goldendesignanalytics.files.wordpress.com/2022/02/image.png?w=599" alt="" class="wp-image-435"/></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Using the <code>library(readxl)</code> I was able to read in the excel file as a dataframe object.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The assisgnemtn calls to use a box plot and a histogram of the data. We have 3 variable of result types across 10 patients. We also have the blood pressure and frequency numerical for each. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>I want to build a histogram grouped by patient showing the count of each disposition.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>First I will make a second data.frame to play with. Then I add a 6th column to the data frame with a count of the rows</p>
<!-- /wp:paragraph -->

<!-- wp:syntaxhighlighter/code {"language":"r"} -->
<pre class="wp-block-syntaxhighlighter-code">sample2 &lt;- sample_data
sample2['Patient_Num'] &lt;- seq(1,10)</pre>
<!-- /wp:syntaxhighlighter/code -->

<!-- wp:image {"align":"center","id":437,"sizeSlug":"large","linkDestination":"none"} -->
<div class="wp-block-image"><figure class="aligncenter size-large"><img src="https://goldendesignanalytics.files.wordpress.com/2022/02/image-1.png?w=603" alt="" class="wp-image-437"/></figure></div>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>We're now ready to play with histograms.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>First up for the visualization I am trying to accomplish I need to manipulate the data. I first remove the first two columns since I am interested in a histogram of the results, grouped by patient. I use the <em>melt</em> function to convert the data from wide to long. Essentially grouping the different variables by the patient.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>The end results is a graph showing the disposition of results of each sample; First, Second and Final Decision</p>
<!-- /wp:paragraph -->

<!-- wp:syntaxhighlighter/code {"language":"r"} -->
<pre class="wp-block-syntaxhighlighter-code">#to show the histograms I want to groupby the Patients

sample2 &lt;- sample_data
sample2['Patient_Num'] &lt;- seq(1,10)

#subset just the columns I want
subset_sample2 &lt;- sample2[, -c(1:2)]

#melt to make the data long
melted &lt;- melt(subset_sample2, "Patient_Num")

#build the histogram
ggplot(melted, aes(x=value , y=Patient_Num , fill = variable)) + geom_bar(stat = 'identity', position = 'stack')
</pre>
<!-- /wp:syntaxhighlighter/code -->

<!-- wp:paragraph -->
<p></p>
<!-- /wp:paragraph -->

<!-- wp:image {"align":"center","id":440,"sizeSlug":"large","linkDestination":"none"} -->
<div class="wp-block-image"><figure class="aligncenter size-large"><img src="https://goldendesignanalytics.files.wordpress.com/2022/02/rplot.jpeg?w=594" alt="" class="wp-image-440"/></figure></div>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>This graph is a little difficult to read however, the reasoning behind this is the values for First, Second, and Final are not standardized. We have either a Good/Bad or a High/Low. As I am not the medical expert, I will not try to match the Good = High or Low. If this were a real life scenario I would instead reach out to my SME (Subject Matter Experts) and work with them to standardize these responses and any future data they provided to simplify this process in the future.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Moving on we can do the box plots:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Again with the limit to the data we will limit the visualization</p>
<!-- /wp:paragraph -->

<!-- wp:syntaxhighlighter/code {"language":"r"} -->
<pre class="wp-block-syntaxhighlighter-code">
##Box plot build out
boxplot(BP~Frequency, data= sample2, notch = FALSE, col = "darkgreen")</pre>
<!-- /wp:syntaxhighlighter/code -->

<!-- wp:image {"align":"center","id":442,"sizeSlug":"large","linkDestination":"none"} -->
<div class="wp-block-image"><figure class="aligncenter size-large"><img src="https://goldendesignanalytics.files.wordpress.com/2022/02/rplot01.jpeg?w=594" alt="" class="wp-image-442"/></figure></div>
<!-- /wp:image -->
