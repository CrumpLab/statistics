# Introduction to data {#introductionToData}

Scientists seek to answer questions using rigorous methods and careful
observations. These observations – collected from the likes of field
notes, surveys, and experiments – form the backbone of a statistical
investigation and are called . Statistics is the study of how best to
collect, analyze, and draw conclusions from data. It is helpful to put
statistics in the context of a general process of investigation:

1.  Identify a question or problem.

2.  Collect relevant data on the topic.

3.  Analyze the data.

4.  Form a conclusion.

Statistics as a subject focuses on making stages 2-4 objective,
rigorous, and efficient. That is, statistics has three primary
components: How best can we collect data? How should it be analyzed? And
what can we infer from the analysis?

The topics scientists investigate are as diverse as the questions they
ask. However, many of these investigations can be addressed with a small
number of data collection techniques, analytic tools, and fundamental
concepts in statistical inference. This chapter provides a glimpse into
these and other themes we will encounter throughout the rest of the
book. We introduce the basic principles of each branch and learn some
tools along the way. We will encounter applications from other fields,
some of which are not typically associated with science but nonetheless
can benefit from statistical study.

## Case study: using stents to prevent strokes {#basicExampleOfStentsAndStrokes}

Section [basicExampleOfStentsAndStrokes] introduces a classic challenge
in statistics: evaluating the efficacy of a medical treatment. Terms in
this section, and indeed much of this chapter, will all be revisited
later in the text. The plan for now is simply to get a sense of the role
statistics can play in practice.

In this section we will consider an experiment that studies
effectiveness of stents in treating patients at risk of stroke.[^1]
Stents are small mesh tubes that are placed inside narrow or weak
arteries to assist in patient recovery after cardiac events and reduce
the risk of an additional heart attack or death. Many doctors have hoped
that there would be similar benefits for patients at risk of stroke. We
start by writing the principal question the researchers hope to answer:

> Does the use of stents reduce the risk of stroke?

The researchers who asked this question collected data on 451 at-risk
patients. Each volunteer patient was randomly assigned to one of two
groups:

-   . Patients in the treatment group received a stent and medical
    management. The medical management included medications, management
    of risk factors, and help in lifestyle modification.

-   . Patients in the control group received the same medical management
    as the treatment group but did not receive stents.

Researchers randomly assigned 224 patients to the treatment group and
227 to the control group. In this study, the control group provides a
reference point against which we can measure the medical impact of
stents in the treatment group.

Researchers studied the effect of stents at two time points: 30 days
after enrollment and 365 days after enrollment. The results of 5
patients are summarized in Table [stentStudyResultsDF]. Patient outcomes
are recorded as “stroke” or “no event”.

  Patient       group     0-30 days   0-365 days
  ---------- ----------- ----------- ------------
  1           treatment   no event     no event
  2           treatment    stroke       stroke
  3           treatment   no event     no event
  $\vdots$    $\vdots$    $\vdots$   
  450          control    no event     no event
  451          control    no event     no event

  : Results for five patients from the stent study.

[stentStudyResultsDF]

Considering data from each patient individually would be a long,
cumbersome path towards answering the original research question.
Instead, a statistical analysis allows us to consider all of the data at
once. Table [stentStudyResults] summarizes the raw data in a more
helpful way. In this table, we can quickly see what happened over the
entire study. For instance, to identify the number of patients in the
treatment group who had a stroke within 30 days, we look on the
left-side of the table at the intersection of the treatment and stroke:
33.

<span>l cc c cc</span> & &

 &\
 & stroke & no event && stroke & no event\
treatment & 33 & 191 && 45 & 179\
control & 13 & 214 && 28 & 199\
Total & 46 & 405 && 73 & 378\

[stentStudyResults]

Of the 224 patients in the treatment group, 45 had a stroke by the end
of the first year. Using these two numbers, compute the proportion of
patients in the treatment group who had a stroke by the end of their
first year. (Answers to all in-text exercises are provided in
footnotes.)[^2]

We can compute summary statistics from the table. A is a single number
summarizing a large amount of data.[^3] For instance, the primary
results of the study after 1 year could be described by two summary
statistics: the proportion of people who had a stroke in the treatment
and control groups.

-   Proportion who had a stroke in the treatment (stent) group:
    $45/224 = 0.20 = 20\%$.

-   Proportion who had a stroke in the control group:
    $28/227 = 0.12 = 12\%$.

These two summary statistics are useful in looking for differences in
the groups, and we are in for a surprise: an additional 8% of patients
in the treatment group had a stroke! This is important for two reasons.
First, it is contrary to what doctors expected, which was that stents
would *reduce* the rate of strokes. Second, it leads to a statistical
question: do the data show a “real” difference due to the treatment?

This second question is subtle. Suppose you flip a coin 100 times. While
the chance a coin lands heads in any given coin flip is 50%, we probably
won’t observe exactly 50 heads. This type of fluctuation is part of
almost any type of data generating process. It is possible that the 8%
difference in the stent study is due to this natural variation. However,
the larger the difference we observe (for a particular sample size), the
less believable it is that the difference is due to chance. So what we
are really asking is the following: is the difference so large that we
should reject the notion that it was due to chance?

While we haven’t yet covered statistical tools to fully address this
question, we can comprehend the conclusions of the published analysis:
there was compelling evidence of harm by stents in this study of stroke
patients.

**Be careful:** do not generalize the results of this study to all
patients and all stents. This study looked at patients with very
specific characteristics who volunteered to be a part of this study and
who may not be representative of all stroke patients. In addition, there
are many types of stents and this study only considered the
self-expanding Wingspan stent (Boston Scientific). However, this study
does leave us with an important lesson: we should keep our eyes open for
surprises.

## Data basics {#dataBasics}

Effective presentation and description of data is a first step in most
analyses. This section introduces one structure for organizing data as
well as some terminology that will be used throughout this book.

### Observations, variables, and data matrices

Table [email50DF] displays rows 1, 2, 3, and 50 of a data set concerning
50 emails received in 2012. These observations will be referred to as
the data set, and they are a random sample from a larger data set that
we will see in Section [categoricalData].

Each row in the table represents a single email or .[^4] The columns
represent characteristics, called , for each of the emails. For example,
the first row represents email 1, which is not spam, contains 21,705
characters, 551 line breaks, is written in HTML format, and contains
only small numbers.

In practice, it is especially important to ask clarifying questions to
ensure important aspects of the data are understood. For instance, it is
always important to be sure we know what each variable means and the
units of measurement. Descriptions of all five email variables are given
in Table [email50Variables].

  ---------- ---------- ---------- ---------- ---------- ----------
      1          no       21,705      551        html      small
      2          no       7,011       183        html       big
      3         yes        631         28        text       none
   $\vdots$   $\vdots$   $\vdots$   $\vdots$   $\vdots$   $\vdots$
      50         no       15,829      242        html      small
  ---------- ---------- ---------- ---------- ---------- ----------

  : Four rows from the data matrix.

[email50DF]

  <span>**variable**</span>   <span>**description**</span>
  --------------------------- --------------------------------------------------------------------------------------------------------------------------------------------
                              Specifies whether the message was spam
                              The number of characters in the email
                              The number of line breaks in the email (not including text wrapping)
                              Indicates if the email contained special formatting, such as bolding, tables, or links, which would indicate the message is in HTML format
                              Indicates whether the email contained no number, a small number (under 1 million), or a large number

  : Variables and their descriptions for the data set.

[email50Variables]

The data in Table [email50DF] represent a , which is a common way to
organize data. Each row of a data matrix corresponds to a unique case,
and each column corresponds to a variable. A data matrix for the stroke
study introduced in Section [basicExampleOfStentsAndStrokes] is shown in
Table , where the cases were patients and there were three variables
recorded for each patient.

Data matrices are a convenient way to record and store data. If another
individual or case is added to the data set, an additional row can be
easily added. Similarly, another column can be added for a new variable.

We consider a publicly available data set that summarizes information
about the 3,143 counties in the United States, and we call this the data
set. This data set includes information about each county: its name, the
state where it resides, its population in 2000 and 2010, per capita
federal spending, poverty rate, and five additional characteristics. How
might these data be organized in a data matrix? Reminder: look in the
footnotes for answers to in-text exercises.[^5]

Seven rows of the data set are shown in Table [countyDF], and the
variables are summarized in Table [countyVariables]. These data were
collected from the US Census website.[^6]

  ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------
      1       Autauga       AL       43671      54571      6.068       10.6       77.5       7.2       24568      53255       none
      2       Baldwin       AL       140415     182265     6.140       12.2       76.7       22.6      26469      50147       none
      3       Barbour       AL       29038      27457      8.752       25.0       68.0       11.1      15875      33219       none
      4         Bibb        AL       20826      22915      7.122       12.6       82.9       6.6       19918      41770       none
      5        Blount       AL       51024      57322      5.131       13.4       82.0       3.7       21070      45549       none
   $\vdots$   $\vdots$   $\vdots$   $\vdots$   $\vdots$   $\vdots$   $\vdots$   $\vdots$   $\vdots$   $\vdots$   $\vdots$   $\vdots$
     3142     Washakie      WY        8289       8533      8.714       5.6        70.9       10.0      28557      48379       none
     3143      Weston       WY        6644       7208      6.695       7.9        77.9       6.5       28463      53853       none
  ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------

  : Seven rows from the data set.

[countyDF]

  <span>**variable**</span>   <span>**description**</span>
  --------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                              County name
                              State where the county resides (also including the District of Columbia)
                              Population in 2000
                              Population in 2010
                              Federal spending per capita
                              Percent of the population in poverty
                              Percent of the population that lives in their own home or lives with the owner (e.g. children living with parents who own the home)
                              Percent of living units that are in multi-unit structures (e.g. apartments)
                              Income per capita
                              Median household income for the county, where a household’s income equals the total income of its occupants who are 15 years or older
                              Type of county-wide smoking ban in place at the end of 2011, which takes one of three values: , , or , where a ban means smoking was not permitted in restaurants, bars, or workplaces, and means smoking was banned in at least one of those three locations

  : Variables and their descriptions for the data set.

[countyVariables]

### Types of variables {#variableTypes}

Examine the , , , and variables in the data set. Each of these variables
is inherently different from the other three yet many of them share
certain characteristics.

First consider , which is said to be a variable since it can take a wide
range of numerical values, and it is sensible to add, subtract, or take
averages with those values. On the other hand, we would not classify a
variable reporting telephone area codes as numerical since their
average, sum, and difference have no clear meaning.

The variable is also numerical, although it seems to be a little
different than . This variable of the population count can only be a
whole non-negative number (, , , ...). For this reason, the population
variable is said to be since it can only take numerical values with
jumps. On the other hand, the federal spending variable is said to be .

The variable can take up to 51 values after accounting for Washington,
DC: , ..., and . Because the responses themselves are categories, is
called a variable,[^7] and the possible values are called the variable’s
.

![Breakdown of variables into their respective
types.](01/figures/variables/variables)

[variables]

Finally, consider the variable, which describes the type of county-wide
smoking ban and takes a value , , or in each county. This variable seems
to be a hybrid: it is a categorical variable but the levels have a
natural ordering. A variable with these properties is called an
variable. To simplify analyses, any ordinal variables in this book will
be treated as categorical variables.

<span>Data were collected about students in a statistics course. Three
variables were recorded for each student: number of siblings, student
height, and whether the student had previously taken a statistics
course. Classify each of the variables as continuous numerical, discrete
numerical, or categorical.</span> The number of siblings and student
height represent numerical variables. Because the number of siblings is
a count, it is discrete. Height varies continuously, so it is a
continuous numerical variable. The last variable classifies students
into two categories – those who have and those who have not taken a
statistics course – which makes this variable categorical.

Consider the variables and (at 30 days) from the stent study in
Section [basicExampleOfStentsAndStrokes]. Are these numerical or
categorical variables?[^8]

### Relationships between variables {#variableRelations}

Many analyses are motivated by a researcher looking for a relationship
between two or more variables. A social scientist may like to answer
some of the following questions:

1.  [fedSpendingPovertyQuestion] Is federal spending, on average, higher
    or lower in counties with high rates of poverty?

2.  [ownershipMultiUnitQuestion] If homeownership is lower than the
    national average in one county, will the percent of multi-unit
    structures in that county likely be above or below the national
    average?

3.  [isAverageIncomeAssociatedWithSmokingBans] Which counties have a
    higher average income: those that enact one or more smoking bans or
    those that do not?

To answer these questions, data must be collected, such as the data set
shown in Table [countyDF]. Examining summary statistics could provide
insights for each of the three questions about counties. Additionally,
graphs can be used to visually summarize data and are useful for
answering such questions as well.

are one type of graph used to study the relationship between two
numerical variables. Figure [county~f~ed~s~pendVsPoverty] compares the
variables and . Each point on the plot represents a single county. For
instance, the highlighted dot corresponds to County 1088 in the data
set: Owsley County, Kentucky, which had a poverty rate of 41.5% and
federal spending of \$21.50 per capita. The dense cloud in the
scatterplot suggests a relationship between the two variables: counties
with a high poverty rate also tend to have slightly more federal
spending. We might brainstorm as to why this relationship exists and
investigate each idea to determine which is the most reasonable
explanation.

![A scatterplot showing against . Owsley County of Kentucky, with a
poverty rate of 41.5% and federal spending of \$21.50 per capita, is
highlighted.](01/figures/county_fed_spendVsPoverty/county_fed_spendVsPoverty)

[county~f~ed~s~pendVsPoverty]

Examine the variables in the data set, which are described in Table .
Create two questions about the relationships between these variables
that are of interest to you.[^9]

The and variables are said to be associated because the plot shows a
discernible pattern. When two variables show some connection with one
another, they are called variables. Associated variables can also be
called variables and vice-versa.

<span> The relationship between the homeownership rate and the percent
of units in multi-unit structures (e.g. apartments, condos) is
visualized using a scatterplot in Figure [multiunitsVsOwnership]. Are
these variables associated?</span> It appears that the larger the
fraction of units in multi-unit structures, the lower the homeownership
rate. Since there is some relationship between the variables, they are
associated.

![A scatterplot of the homeownership rate versus the percent of units
that are in multi-unit structures for all 3,143 counties. Interested
readers may find an image of this plot with an additional third
variable, county population, presented at
[www.openintro.org/stat/down/MHP.png](http://www.openintro.org/stat/down/MHP.png).](01/figures/multiunitsVsOwnership/multiunitsVsOwnership)

[multiunitsVsOwnership]

Because there is a downward trend in Figure [multiunitsVsOwnership] –
counties with more units in multi-unit structures are associated with
lower homeownership – these variables are said to be . A is shown in the
relationship between the and variables represented in
Figure [county~f~ed~s~pendVsPoverty], where counties with higher poverty
rates tend to receive more federal spending per capita.

If two variables are not associated, then they are said to be . That is,
two variables are independent if there is no evident relationship
between the two.

<span> A pair of variables are either related in some way (associated)
or not (independent). No pair of variables is both associated and
independent.</span>

## Overview of data collection principles {#overviewOfDataCollectionPrinciples}

The first step in conducting research is to identify topics or questions
that are to be investigated. A clearly laid out research question is
helpful in identifying what subjects or cases should be studied and what
variables are important. It is also important to consider *how* data are
collected so that they are reliable and help achieve the research goals.

### Populations and samples {#populationsAndSamples}

Consider the following three research questions:

1.  What is the average mercury content in swordfish in the Atlantic
    Ocean?

2.  [timeToGraduationQuestionForUCLAStudents] Over the last 5 years,
    what is the average time to complete a degree for Duke undergraduate
    students?

3.  [identifyPopulationOfStentStudy] Does a new drug reduce the number
    of deaths in patients with severe heart disease?

Each research question refers to a target . In the first question, the
target population is all swordfish in the Atlantic ocean, and each fish
represents a case. It is usually too expensive to collect data for every
case in a population. Instead, a sample is taken. A represents a subset
of the cases and is often a small fraction of the population. For
instance, 60 swordfish (or some other number) in the population might be
selected, and this sample data may be used to provide an estimate of the
population average and answer the research question.

[identifyingThePopulationForTwoQuestionsInPopAndSampSubsection] For the
second and third questions above, identify the target population and
what represents an individual case.[^10]

### Anecdotal evidence {#anecdotalEvidenceSubsection}

Consider the following possible responses to the three research
questions:

1.  A man on the news got mercury poisoning from eating swordfish, so
    the average mercury concentration in swordfish must be dangerously
    high.

2.  [iKnowThreeStudentsWhoTookMoreThan7YearsToGraduateAtDuke] I met two
    students who took more than 7 years to graduate from Duke, so it
    must take longer to graduate at Duke than at many other colleges.

3.  [myFriendsDadDiedAfterSulphinpyrazon] My friend’s dad had a heart
    attack and died after they gave him a new heart disease drug, so the
    drug must not work.

Each conclusion is based on data. However, there are two problems.
First, the data only represent one or two cases. Second, and more
importantly, it is unclear whether these cases are actually
representative of the population. Data collected in this haphazard
fashion are called .

<span> Be careful of data collected haphazardly. Such evidence may be
true and verifiable, but it may only represent extraordinary
cases.</span>

Anecdotal evidence typically is composed of unusual cases that we recall
based on their striking characteristics. For instance, we are more
likely to remember the two people we met who took 7 years to graduate
than the six others who graduated in four years. Instead of looking at
the most unusual cases, we should examine a sample of many cases that
represent the population.

### Sampling from a population

We might try to estimate the time to graduation for Duke undergraduates
in the last 5 years by collecting a sample of students. All graduates in
the last 5 years represent the *population*, and graduates who are
selected for review are collectively called the *sample*. In general, we
always seek to *randomly* select a sample from a population. The most
basic type of random selection is equivalent to how raffles are
conducted. For example, in selecting graduates, we could write each
graduate’s name on a raffle ticket and draw 100 tickets. The selected
names would represent a random sample of 100 graduates.

![In this graphic, five graduates are randomly selected from the
population to be included in the
sample.](01/figures/popToSample/popToSampleGraduates)

[popToSampleGraduates]

Why pick a sample randomly? Why not just pick a sample by hand? Consider
the following scenario.

<span>Suppose we ask a student who happens to be majoring in nutrition
to select several graduates for the study. What kind of students do you
think she might collect? Do you think her sample would be representative
of all graduates?</span> Perhaps she would pick a disproportionate
number of graduates from health-related fields. Or perhaps her selection
would be well-representative of the population. When selecting samples
by hand, we run the risk of picking a *biased* sample, even if that bias
is unintentional or difficult to discern.

![Instead of sampling from all graduates equally, a nutrition major
might inadvertently pick graduates with health-related majors
disproportionately
often.](01/figures/popToSample/popToSubSampleGraduates)

[popToSubSampleGraduates]

If someone was permitted to pick and choose exactly which graduates were
included in the sample, it is entirely possible that the sample could be
skewed to that person’s interests, which may be entirely unintentional.
This introduces into a sample. Sampling randomly helps resolve this
problem. The most basic random sample is called a , which is equivalent
to using a raffle to select cases. This means that each case in the
population has an equal chance of being included and there is no implied
connection between the cases in the sample.

The act of taking a simple random sample helps minimize bias, however,
bias can crop up in other ways. Even when people are picked at random,
e.g. for surveys, caution must be exercised if the is high. For
instance, if only 30% of the people randomly sampled for a survey
actually respond, and it is unclear whether the respondents are of the
entire population, the survey might suffer from .

![Due to the possibility of non-response, surveys studies may only reach
a certain group within the population. It is difficult, and often
impossible, to completely fix this
problem.](01/figures/popToSample/surveySample)

[surveySample]

Another common downfall is a , where individuals who are easily
accessible are more likely to be included in the sample. For instance,
if a political survey is done by stopping people walking in the Bronx,
it will not represent all of New York City. It is often difficult to
discern what sub-population a convenience sample represents.

We can easily access ratings for products, sellers, and companies
through websites. These ratings are based only on those people who go
out of their way to provide a rating. If 50% of online reviews for a
product are negative, do you think this means that 50% of buyers are
dissatisfied with the product?[^11]

### Explanatory and response variables {#explanatoryAndResponse}

Consider the following question from page  for the data set:

1.  Is federal spending, on average, higher or lower in counties with
    high rates of poverty?

If we suspect poverty might affect spending in a county, then poverty is
the variable and federal spending is the variable in the
relationship.[^12] If there are many variables, it may be possible to
consider a number of them as explanatory variables.

To identify the explanatory variable in a pair of variables, identify
which of the two is suspected of affecting the other.

![image](01/figures/expResp/expResp)

<span>association does not imply causation</span><span>Labeling
variables as *explanatory* and *response* does not guarantee the
relationship between the two is actually causal, even if there is an
association identified between the two variables. We use these labels
only to keep track of which variable we suspect affects the
other.</span>

In some cases, there is no explanatory or response variable. Consider
the following question from page :

1.  If homeownership is lower than the national average in one county,
    will the percent of multi-unit structures in that county likely be
    above or below the national average?

It is difficult to decide which of these variables should be considered
the explanatory and response variable, i.e. the direction is ambiguous,
so no explanatory or response labels are suggested here.

### Introducing observational studies and experiments

There are two primary types of data collection: observational studies
and experiments.

Researchers perform an when they collect data in a way that does not
directly interfere with how the data arise. For instance, researchers
may collect information via surveys, review medical or company records,
or follow a of many similar individuals to study why certain diseases
might develop. In each of these situations, researchers merely observe
what happens. In general, observational studies can provide evidence of
a naturally occurring association between variables, but they cannot by
themselves show a causal connection.

When researchers want to investigate the possibility of a causal
connection, they conduct an . Usually there will be both an explanatory
and a response variable. For instance, we may suspect administering a
drug will reduce mortality in heart attack patients over the following
year. To check if there really is a causal connection between the
explanatory variable and the response, researchers will collect a sample
of individuals and split them into groups. The individuals in each group
are *assigned* a treatment. When individuals are randomly assigned to a
group, the experiment is called a . For example, each heart attack
patient in the drug trial could be randomly assigned, perhaps by
flipping a coin, into one of two groups: the first group receives a
(fake treatment) and the second group receives the drug. See the case
study in Section [basicExampleOfStentsAndStrokes] for another example of
an experiment, though that study did not employ a placebo.

<span> In a data analysis, association does not imply causation, and
causation can only be inferred from a randomized experiment.</span>

## Observational studies and sampling strategies

### Observational studies

Generally, data in observational studies are collected only by
monitoring what occurs, while experiments require the primary
explanatory variable in a study be assigned for each subject by the
researchers.

Making causal conclusions based on experiments is often reasonable.
However, making the same causal conclusions based on observational data
can be treacherous and is not recommended. Thus, observational studies
are generally only sufficient to show associations.

[sunscreenLurkingExample] Suppose an observational study tracked
sunscreen use and skin cancer, and it was found that the more sunscreen
someone used, the more likely the person was to have skin cancer. Does
this mean sunscreen *causes* skin cancer?[^13]

Some previous research tells us that using sunscreen actually reduces
skin cancer risk, so maybe there is another variable that can explain
this hypothetical association between sunscreen usage and skin cancer.
One important piece of information that is absent is sun exposure. If
someone is out in the sun all day, she is more likely to use sunscreen
*and* more likely to get skin cancer. Exposure to the sun is unaccounted
for in the simple investigation.

![image](01/figures/variables/sunCausesCancer)

Sun exposure is what is called a ,[^14] which is a variable that is
correlated with both the explanatory and response variables. While one
method to justify making causal conclusions from observational studies
is to exhaust the search for confounding variables, there is no
guarantee that all confounding variables can be examined or measured.

In the same way, the data set is an observational study with confounding
variables, and its data cannot easily be used to make causal
conclusions.

Figure [multiunitsVsOwnership] shows a negative association between the
homeownership rate and the percentage of multi-unit structures in a
county. However, it is unreasonable to conclude that there is a causal
relationship between the two variables. Suggest one or more other
variables that might explain the relationship in
Figure [multiunitsVsOwnership]. [^15]

Observational studies come in two forms: prospective and retrospective
studies. A identifies individuals and collects information as events
unfold. For instance, medical researchers may identify and follow a
group of similar individuals over many years to assess the possible
influences of behavior on cancer risk. One example of such a study is
The Nurses’ Health Study, started in 1976 and expanded in 1989.[^16]
This prospective study recruits registered nurses and then collects data
from them using questionnaires. collect data after events have taken
place, e.g. researchers may review past events in medical records. Some
data sets, such as , may contain both prospectively- and
retrospectively-collected variables. Local governments prospectively
collect some variables as events unfolded (e.g. retails sales) while the
federal government retrospectively collected others during the 2010
census (e.g. county population).

### Three sampling methods (special topic) {#threeSamplingMethods}

Almost all statistical methods are based on the notion of implied
randomness. If observational data are not collected in a random
framework from a population, results from these statistical methods are
not reliable. Here we consider three random sampling techniques: simple,
stratified, and cluster sampling. Figure [samplingMethodsFigure]
provides a graphical representation of these techniques.

![Examples of simple random, stratified, and cluster sampling. In the
top panel, simple random sampling was used to randomly select the 18
cases. In the middle panel, stratified sampling was used: cases were
grouped into strata, and then simple random sampling was employed within
each stratum. In the bottom panel, cluster sampling was used, where data
were binned into nine clusters, and three of the clusters were randomly
selected.](01/figures/samplingMethodsFigure/samplingMethodsFigure)

[samplingMethodsFigure]

is probably the most intuitive form of random sampling. Consider the
salaries of Major League Baseball (MLB) players, where each player is a
member of one of the league’s 30 teams. To take a simple random sample
of 120 baseball players and their salaries from the 2010 season, we
could write the names of that season’s 828 players onto slips of paper,
drop the slips into a bucket, shake the bucket around until we are sure
the names are all mixed up, then draw out slips until we have the sample
of 120 players. In general, a sample is referred to as “simple random”
if each case in the population has an equal chance of being included in
the final sample *and* knowing that a case is included in a sample does
not provide useful information about which other cases are included.

is a divide-and-conquer sampling strategy. The population is divided
into groups called . The strata are chosen so that similar cases are
grouped together, then a second sampling method, usually simple random
sampling, is employed within each stratum. In the baseball salary
example, the teams could represent the strata; some teams have a lot
more money (we’re looking at you, Yankees). Then we might randomly
sample 4 players from each team for a total of 120 players.

Stratified sampling is especially useful when the cases in each stratum
are very similar with respect to the outcome of interest. The downside
is that analyzing data from a stratified sample is a more complex task
than analyzing data from a simple random sample. The analysis methods
introduced in this book would need to be extended to analyze data
collected using stratified sampling.

<span>Why would it be good for cases within each stratum to be very
similar?</span> We might get a more stable estimate for the
subpopulation in a stratum if the cases are very similar. These improved
estimates for each subpopulation will help us build a reliable estimate
for the full population.

In , we group observations into clusters, then randomly sample some of
the clusters. Sometimes cluster sampling can be a more economical
technique than the alternatives. Also, unlike stratified sampling,
cluster sampling is most helpful when there is a lot of case-to-case
variability within a cluster but the clusters themselves don’t look very
different from one another. For example, if neighborhoods represented
clusters, then this sampling method works best when the neighborhoods
are very diverse. A downside of cluster sampling is that more advanced
analysis techniques are typically required, though the methods in this
book can be extended to handle such data.

<span>Suppose we are interested in estimating the malaria rate in a
densely tropical portion of rural Indonesia. We learn that there are 30
villages in that part of the Indonesian jungle, each more or less
similar to the next. What sampling method should be employed?</span> A
simple random sample would likely draw individuals from all 30 villages,
which could make data collection extremely expensive. Stratified
sampling would be a challenge since it is unclear how we would build
strata of similar individuals. However, cluster sampling seems like a
very good idea. We might randomly select a small number of villages.
This would probably reduce our data collection costs substantially in
comparison to a simple random sample and would still give us helpful
information.

Another technique called is similar to cluster sampling, except that we
take a simple random sample within each selected cluster. For instance,
if we sampled neighborhoods using cluster sampling, we would next sample
a subset of homes within each selected neighborhood if we were using
multistage sampling.

## Experiments {#experimentsSection}

Studies where the researchers assign treatments to cases are called .
When this assignment includes randomization, e.g. using a coin flip to
decide which treatment a patient receives, it is called a . Randomized
experiments are fundamentally important when trying to show a causal
connection between two variables.

### Principles of experimental design {#experimentalDesignPrinciples}

Randomized experiments are generally built on four principles.

Controlling.

:   Researchers assign treatments to cases, and they do their best to
    any other differences in the groups. For example, when patients take
    a drug in pill form, some patients take the pill with only a sip of
    water while others may have it with an entire glass of water. To
    control for the effect of water consumption, a doctor may ask all
    patients to drink a 12 ounce glass of water with the pill.

Randomization.

:   Researchers randomize patients into treatment groups to account for
    variables that cannot be controlled. For example, some patients may
    be more susceptible to a disease than others due to their dietary
    habits. Randomizing patients into the treatment or control group
    helps even out such differences, and it also prevents accidental
    bias from entering the study.

Replication.

:   The more cases researchers observe, the more accurately they can
    estimate the effect of the explanatory variable on the response. In
    a single study, we by collecting a sufficiently large sample.
    Additionally, a group of scientists may replicate an entire study to
    verify an earlier finding.

    ![Blocking using a variable depicting patient risk. Patients are
    first divided into low-risk and high-risk blocks, then each block is
    evenly divided into the treatment groups using randomization. This
    strategy ensures an equal representation of patients in each
    treatment group from both the low-risk and high-risk
    categories.](01/figures/figureShowingBlocking/figureShowingBlocking)

    [figureShowingBlocking]

Blocking.

:   Researchers sometimes know or suspect that variables, other than the
    treatment, influence the response. Under these circumstances, they
    may first group individuals based on this variable and then
    randomize cases within each block to the treatment groups. This
    strategy is often referred to as . For instance, if we are looking
    at the effect of a drug on heart attacks, we might first split
    patients into low-risk and high-risk , then randomly assign half the
    patients from each block to the control group and the other half to
    the treatment group, as shown in Figure [figureShowingBlocking].
    This strategy ensures each treatment group has an equal number of
    low-risk and high-risk patients.

It is important to incorporate the first three experimental design
principles into any study, and this book describes methods for analyzing
data from such experiments. Blocking is a slightly more advanced
technique, and statistical methods in this book may be extended to
analyze data collected using blocking.

### Reducing bias in human experiments {#biasInHumanExperiments}

Randomized experiments are the gold standard for data collection, but
they do not ensure an unbiased perspective into the cause and effect
relationships in all cases. Human studies are perfect examples where
bias can unintentionally arise. Here we reconsider a study where a new
drug was used to treat heart attack patients.[^17] In particular,
researchers wanted to know if the drug reduced deaths in patients.

These researchers designed a randomized experiment because they wanted
to draw causal conclusions about the drug’s effect. Study
volunteers[^18] were randomly placed into two study groups. One group,
the , received the drug. The other group, called the , did not receive
any drug treatment.

Put yourself in the place of a person in the study. If you are in the
treatment group, you are given a fancy new drug that you anticipate will
help you. On the other hand, a person in the other group doesn’t receive
the drug and sits idly, hoping her participation doesn’t increase her
risk of death. These perspectives suggest there are actually two
effects: the one of interest is the effectiveness of the drug, and the
second is an emotional effect that is difficult to quantify.

Researchers aren’t usually interested in the emotional effect, which
might bias the study. To circumvent this problem, researchers do not
want patients to know which group they are in. When researchers keep the
patients uninformed about their treatment, the study is said to be . But
there is one problem: if a patient doesn’t receive a treatment, she will
know she is in the control group. The solution to this problem is to
give fake treatments to patients in the control group. A fake treatment
is called a , and an effective placebo is the key to making a study
truly blind. A classic example of a placebo is a sugar pill that is made
to look like the actual treatment pill. Often times, a placebo results
in a slight but real improvement in patients. This effect has been
dubbed the .

The patients are not the only ones who should be blinded: doctors and
researchers can accidentally bias a study. When a doctor knows a patient
has been given the real treatment, she might inadvertently give that
patient more attention or care than a patient that she knows is on the
placebo. To guard against this bias, which again has been found to have
a measurable effect in some instances, most modern studies employ a
setup where doctors or researchers who interact with patients are, just
like the patients, unaware of who is or is not receiving the
treatment.[^19]

Look back to the study in Section [basicExampleOfStentsAndStrokes] where
researchers were testing whether stents were effective at reducing
strokes in at-risk patients. Is this an experiment? Was the study
blinded? Was it double-blinded?[^20]

## Examining numerical data {#numericalData}

This section introduces techniques for exploring and summarizing
numerical variables, and the and data sets from Section [dataBasics]
provide rich opportunities for examples. Recall that outcomes of
numerical variables are numbers on which it is reasonable to perform
basic arithmetic operations. For example, the variable, which represents
the populations of counties in 2010, is numerical since we can sensibly
discuss the difference or ratio of the populations in two counties. On
the other hand, area codes and zip codes are not numerical.

### Scatterplots for paired data {#scatterPlots}

A provides a case-by-case view of data for two numerical variables. In
Figure , a scatterplot was used to examine how federal spending and
poverty were related in the data set. Another scatterplot is shown in
Figure [email50LinesCharacters], comparing the number of line breaks ()
and number of characters () in emails for the data set. In any
scatterplot, each point represents a single case. Since there are 50
cases in , there are 50 points in Figure [email50LinesCharacters].

![A scatterplot of versus for the
data.](01/figures/email50LinesCharacters/email50LinesCharacters)

[email50LinesCharacters]

To put the number of characters in perspective, this paragraph has 363
characters. Looking at Figure [email50LinesCharacters], it seems that
some emails are incredibly long! Upon further investigation, we would
actually find that most of the long emails use the HTML format, which
means most of the characters in those emails are used to format the
email rather than provide text.

What do scatterplots reveal about the data, and how might they be
useful?[^21]

<span>Consider a new data set of 54 cars with two variables: vehicle
price and weight.[^22] A scatterplot of vehicle price versus weight is
shown in Figure [carsPriceVsWeight]. What can be said about the
relationship between these variables?</span> The relationship is
evidently nonlinear, as highlighted by the dashed line. This is
different from previous scatterplots we’ve seen, such as Figure  and
Figure [email50LinesCharacters], which show relationships that are very
linear.

![A scatterplot of versus for 54
cars.](01/figures/carsPriceVsWeight/carsPriceVsWeight)

[carsPriceVsWeight]

Describe two variables that would have a horseshoe shaped association in
a scatterplot.[^23]

### Dot plots and the mean {#dotPlot}

Sometimes two variables is one too many: only one variable may be of
interest. In these cases, a dot plot provides the most basic of
displays. A  is a one-variable scatterplot; an example using the number
of characters from 50 emails is shown in
Figure [emailCharactersDotPlot]. A stacked version of this dot plot is
shown in Figure [emailCharactersDotPlotStacked].

![A dot plot of for the data
set.](01/figures/emailCharactersDotPlot/emailCharactersDotPlot)

[emailCharactersDotPlot]

![A stacked dot plot of for the data
set.](01/figures/emailCharactersDotPlot/emailCharactersDotPlotStacked)

[emailCharactersDotPlotStacked]

The , sometimes called the , is a common way to measure the center of a
of data. To find the mean number of characters in the 50 emails, we add
up all the character counts and divide by the number of emails. For
computational convenience, the number of characters is listed in the
thousands and rounded to the first decimal.

$$\begin{aligned}
\bar{x} = \frac{21.7 + 7.0 + \cdots + 15.8}{50} = 11.6
\label{sampleMeanEquation}\end{aligned}$$

The sample mean is often labeled $\bar{x}$, and the letter $x$ is being
used as a generic placeholder for the variable of interest, . The sample
mean is shown as a triangle in Figures [emailCharactersDotPlot]
and [emailCharactersDotPlotStacked].

The sample mean of a numerical variable is the sum of all of the
observations divided by the number of observations:

$$\begin{aligned}
\bar{x} = \frac{x_1+x_2+\cdots+x_n}{n}
\label{meanEquation}\end{aligned}$$

where $x_1, x_2, \dots, x_n$ represent the $n$ observed values.

[

$n$\
sample size]

$n$\
sample size

Examine Equations  and  above. What does $x_1$ correspond to? And $x_2$?
Can you infer a general meaning to what $x_i$ might represent?[^24]

What was $n$ in this sample of emails?[^25]

The data set is a sample from a larger population of emails that were
received in January and March. We could compute a mean for this
population in the same way as the sample mean. However, there is a
difference in notation: the population mean has a special label: $\mu$.
The symbol $\mu$ is the Greek letter *mu* and represents the average of
all observations in the population. Sometimes a subscript, such as $_x$,
is used to represent which variable the population mean refers to, e.g.
$\mu_x$.

<span>The average number of characters across all emails can be
estimated using the sample data. Based on the sample of 50 emails, what
would be a reasonable estimate of $\mu_x$, the mean number of characters
in all emails in the data set? (Recall that is a sample from .)</span>
The sample mean, 11,600, may provide a reasonable estimate of $\mu_x$.
While this number will not be perfect, it provides a of the population
mean. In Chapter [FoundationForInference] and beyond, we will develop
tools to characterize the accuracy of point estimates, and we will find
that point estimates based on larger samples tend to be more accurate
than those based on smaller samples.

<span>We might like to compute the average income per person in the US.
To do so, we might first think to take the mean of the per capita
incomes from the 3,143 counties in the data set. What would be a better
approach?</span> [wtdMeanOfIncome] The data set is special in that each
county actually represents many individual people. If we were to simply
average across the variable, we would be treating counties with 5,000
and 5,000,000 residents equally in the calculations. Instead, we should
compute the total income for each county, add up all the counties’
totals, and then divide by the number of people in all the counties. If
we completed these steps with the data, we would find that the per
capita income for the US is \$27,348.43. Had we computed the *simple*
mean of per capita income across counties, the result would have been
just \$22,504.70!

Example [wtdMeanOfIncome] used what is called a , which will not be a
key topic in this textbook. However, we have provided an online
supplement on weighted means for interested readers:

### Histograms and shape {#histogramsAndShape}

Dot plots show the exact value of each observation. This is useful for
small data sets, but they can become hard to read with larger samples.
Rather than showing the value of each observation, think of the value as
belonging to a *bin*. For example, in the data set, we create a table of
counts for the number of cases with character counts between 0 and
5,000, then the number of cases between 5,000 and 10,000, and so on.
Observations that fall on the boundary of a bin (e.g. 5,000) are
allocated to the lower bin. This tabulation is shown in
Table [binnedNumCharTable]. These binned counts are plotted as bars in
Figure [email50NumCharHist] into what is called a , which resembles the
stacked dot plot shown in Figure [emailCharactersDotPlotStacked].

  ---------------- ----------------------- ------------------------ ------------------------- ------------------------- ------------------------- ------------------------- ---------------------------- ------------------------- ------------------------- --
  Characters                                                                                                                                                                                                                                                 
  (in thousands)    [0pt]<span>0-5</span>   [0pt]<span>5-10</span>   [0pt]<span>10-15</span>   [0pt]<span>15-20</span>   [0pt]<span>20-25</span>   [0pt]<span>25-30</span>   [0pt]<span>$\cdots$</span>   [0pt]<span>55-60</span>   [0pt]<span>60-65</span>  
  Count                      19                       12                        6                         2                         3                         5                       $\cdots$                       0                         1             
  ---------------- ----------------------- ------------------------ ------------------------- ------------------------- ------------------------- ------------------------- ---------------------------- ------------------------- ------------------------- --

  : The counts for the binned data.

[binnedNumCharTable]

![A histogram of . This distribution is very strongly skewed to the
right.](01/figures/email50NumCharHist/email50NumCharHist)

[email50NumCharHist]

Histograms provide a view of the . Higher bars represent where the data
are relatively more dense. For instance, there are many more emails
between 0 and 10,000 characters than emails between 10,000 and 20,000
characters in the data set. The bars make it easy to see how the density
of the data changes relative to the number of characters.

Histograms are especially convenient for describing the shape of the
data distribution[shapeFirstDiscussed]. Figure [email50NumCharHist]
shows that most emails have a relatively small number of characters,
while fewer emails have a very large number of characters. When data
trail off to the right in this way and have a longer right , the shape
is said to be .[^26]

Data sets with the reverse characteristic – a long, thin tail to the
left – are said to be . We also say that such a distribution has a long
left tail. Data sets that show roughly equal trailing off in both
directions are called .

<span>When data trail off in one direction, the distribution has a . If
a distribution has a long left tail, it is left skewed. If a
distribution has a long right tail, it is right skewed.</span>

Take a look at the dot plots in Figures [emailCharactersDotPlot]
and [emailCharactersDotPlotStacked]. Can you see the skew in the data?
Is it easier to see the skew in this histogram or the dot plots?[^27]

Besides the mean (since it was labeled), what can you see in the dot
plots that you cannot see in the histogram?[^28]

In addition to looking at whether a distribution is skewed or symmetric,
histograms can be used to identify modes. A is represented by a
prominent peak in the distribution.[^29] There is only one prominent
peak in the histogram of .

Figure [singleBiMultiModalPlots] shows histograms that have one, two, or
three prominent peaks. Such distributions are called , , and ,
respectively. Any distribution with more than 2 prominent peaks is
called multimodal. Notice that there was one prominent peak in the
unimodal distribution with a second less prominent peak that was not
counted since it only differs from its neighboring bins by a few
observations.

![Counting only prominent peaks, the distributions are (left to right)
unimodal, bimodal, and
multimodal.](01/figures/singleBiMultiModalPlots/singleBiMultiModalPlots)

[singleBiMultiModalPlots]

Figure [email50NumCharHist] reveals only one prominent mode in the
number of characters. Is the distribution unimodal, bimodal, or
multimodal?[^30]

Height measurements of young students and adult teachers at a K-3
elementary school were taken. How many modes would you anticipate in
this height data set?[^31]

<span> Looking for modes isn’t about finding a clear and correct answer
about the number of modes in a distribution, which is why *prominent* is
not rigorously defined in this book. The important part of this
examination is to better understand your data and how it might be
structured.</span>

### Variance and standard deviation {#variability}

The mean is used to describe the center of a data set, but the in the
data is also important. Here, we introduce two measures of variability:
the variance and the standard deviation. Both of these are very useful
in data analysis, even though the formulas are a bit tedious to
calculate by hand. The standard deviation is the easier of the two to
conceptually understand, and it roughly describes how far away the
typical observation is from the mean.

We call the distance of an observation from its mean its . Below are the
deviations for the $1^{st}_{}$, $2^{nd}_{}$, $3^{rd}$, and $50^{th}_{}$
observations in the variable. For computational convenience, the number
of characters is listed in the thousands and rounded to the first
decimal.

$$\begin{aligned}
x_1^{}-\bar{x} &= 21.7 - 11.6 = 10.1 \hspace{5mm}\text{ } \\
x_2^{}-\bar{x} &= 7.0 - 11.6 = -4.6 \\
x_3^{}-\bar{x} &= 0.6 - 11.6 = -11.0 \\
            &\ \vdots \\
x_{50}^{}-\bar{x} &= 15.8 - 11.6 = 4.2\end{aligned}$$

If we square these deviations and then take an average, the result is
about equal to the sample [varianceIsDefined], denoted by $s_{}^2$:

$$\begin{aligned}
s_{}^2 &= \frac{10.1_{}^2 + (-4.6)_{}^2 + (-11.0)_{}^2 + \cdots + 4.2_{}^2}{50-1} \\
    &= \frac{102.01 + 21.16 + 121.00 + \cdots + 17.64}{49} \\
    &= 172.44\end{aligned}$$

We divide by $n-1$, rather than dividing by $n$, when computing the
variance; you need not worry about this mathematical nuance for the
material in this textbook. Notice that squaring the deviations does two
things. First, it makes large values much larger, seen by comparing
$10.1^2$, $(-4.6)^2$, $(-11.0)^2$, and $4.2^2$. Second, it gets rid of
any negative signs.

The is the square root of the variance: $$s=\sqrt{172.44} = 13.13$$ [

$s$\
sample standard deviation]

$s$\
sample standard deviation

The standard deviation of the number of characters in an email is about
13.13 thousand. A subscript of $_x$ may be added to the variance and
standard deviation, i.e. $s_x^2$ and $s_x^{}$, as a reminder that these
are the variance and standard deviation of the observations represented
by $x_1^{}$, $x_2^{}$, ..., $x_n^{}$. The $_{x}$ subscript is usually
omitted when it is clear which data the variance or standard deviation
is referencing.

<span> The variance is roughly the average squared distance from the
mean. The standard deviation is the square root of the variance and
describes how close the data are to the mean.</span>

Formulas and methods used to compute the variance and standard deviation
for a population are similar to those used for a sample.[^32] However,
like the mean, the population values have special symbols:
$\sigma_{}^2$[$\sigma_{}^2$\
population variance\

]

$\sigma_{}^2$\
population variance\

for the variance and $\sigma$[$\sigma$\
population standard deviation\

]

$\sigma$\
population standard deviation\

for the standard deviation. The symbol $\sigma$ is the Greek letter
*sigma*.

![In the data, 41 of the 50 emails (82%) are within 1 standard deviation
of the mean, and 47 of the 50 emails (94%) are within 2 standard
deviations. Usually about 70% of the data are within 1 standard
deviation of the mean and 95% are within 2 standard deviations, though
this rule of thumb is less accurate for skewed data, as shown in this
example.](01/figures/sdAsRuleForEmailNumChar/sdAsRuleForEmailNumChar)

[sdAsRuleForEmailNumChar]

<span> Focus on the conceptual meaning of the standard deviation as a
descriptor of variability rather than the formulas. Usually 70% of the
data will be within one standard deviation of the mean and about 95%
will be within two standard deviations. However, as seen in
Figures [sdAsRuleForEmailNumChar] and [severalDiffDistWithSdOf1], these
percentages are not strict rules.</span>

![Three very different population distributions with the same mean
$\mu=0$ and standard deviation
$\sigma=1$.](01/figures/severalDiffDistWithSdOf1/severalDiffDistWithSdOf1)

[severalDiffDistWithSdOf1]

On page , the concept of shape of a distribution was introduced. A good
description of the shape of a distribution should include modality and
whether the distribution is symmetric or skewed to one side. Using
Figure [severalDiffDistWithSdOf1] as an example, explain why such a
description is important.[^33]

<span>Describe the distribution of the variable using the histogram in
Figure . The description should incorporate the center, variability, and
shape of the distribution, and it should also be placed in context: the
number of characters in emails. Also note any especially unusual
cases.</span> The distribution of email character counts is unimodal and
very strongly skewed to the high end. Many of the counts fall near the
mean at 11,600, and most fall within one standard deviation (13,130) of
the mean. There is one exceptionally long email with about 65,000
characters.

In practice, the variance and standard deviation are sometimes used as a
means to an end, where the “end” is being able to accurately estimate
the uncertainty associated with a sample statistic. For example, in
Chapter [FoundationForInference] we will use the variance and standard
deviation to assess how close the sample mean is to the population mean.

### Box plots, quartiles, and the median

A summarizes a data set using five statistics while also plotting
unusual observations. Figure [boxPlotLayoutNumVar] provides a vertical
dot plot alongside a box plot of the variable from the data set.

![A vertical dot plot next to a labeled box plot for the number of
characters in 50 emails. The median (6,890), splits the data into the
bottom 50% and the top 50%, marked in the dot plot by horizontal dashes
and open circles,
respectively.](01/figures/boxPlotLayoutNumVar/boxPlotLayoutNumVar)

[boxPlotLayoutNumVar]

The first step in building a box plot is drawing a dark line denoting
the , which splits the data in half. Figure [boxPlotLayoutNumVar] shows
50% of the data falling below the median (dashes) and other 50% falling
above the median (open circles). There are 50 character counts in the
data set (an even number) so the data are perfectly split into two
groups of 25. We take the median in this case to be the average of the
two observations closest to the $50^{th}$ percentile:
$(\text{6,768} + \text{7,012}) / 2 = \text{6,890}$. When there are an
odd number of observations, there will be exactly one observation that
splits the data into two halves, and in this case that observation is
the median (no average needed).

<span> If the data are ordered from smallest to largest, the is the
observation right in the middle. If there are an even number of
observations, there will be two values in the middle, and the median is
taken as their average.</span>

The second step in building a box plot is drawing a rectangle to
represent the middle 50% of the data. The total length of the box, shown
vertically in Figure [boxPlotLayoutNumVar], is called the (, for short).
It, like the standard deviation, is a measure of in data. The more
variable the data, the larger the standard deviation and IQR. The two
boundaries of the box are called the (the $25^{th}$ , i.e. 25% of the
data fall below this value) and the (the $75^{th}$ percentile), and
these are often labeled $Q_1$ and $Q_3$, respectively.

The IQR is the length of the box in a box plot. It is computed as

$$\begin{aligned}
IQR = Q_3 - Q_1\end{aligned}$$

where $Q_1$ and $Q_3$ are the $25^{th}$ and $75^{th}$ percentiles.

What percent of the data fall between $Q_1$ and the median? What percent
is between the median and $Q_3$?[^34]

Extending out from the box, the attempt to capture the data outside of
the box, however, their reach is never allowed to be more than
$1.5\times IQR$.[^35] They capture everything within this reach. In
Figure [boxPlotLayoutNumVar], the upper whisker does not extend to the
last three points, which are beyond $Q_3 + 1.5\times IQR$, and so it
extends only to the last point below this limit. The lower whisker stops
at the lowest value, 33, since there is no additional data to reach; the
lower whisker’s limit is not shown in the figure because the plot does
not extend down to $Q_1 - 1.5\times IQR$. In a sense, the box is like
the body of the box plot and the whiskers are like its arms trying to
reach the rest of the data.

Any observation that lies beyond the whiskers is labeled with a dot. The
purpose of labeling these points – instead of just extending the
whiskers to the minimum and maximum observed values – is to help
identify any observations that appear to be unusually distant from the
rest of the data. Unusually distant observations are called . In this
case, it would be reasonable to classify the emails with character
counts of 41,623, 42,793, and 64,401 as outliers since they are
numerically distant from most of the data.

<span> An is an observation that is extreme relative to the rest of the
data.</span>

Examination of data for possible outliers serves many useful purposes,
including

1.  Identifying in the distribution.

2.  Identifying data collection or entry errors. For instance, we
    re-examined the email purported to have 64,401 characters to ensure
    this value was accurate.

3.  Providing insight into interesting properties of the data.

The observation 64,401, an outlier, was found to be an accurate
observation. What would such an observation suggest about the nature of
character counts in emails?[^36]

Using Figure [boxPlotLayoutNumVar], estimate the following values for in
the data set: (a) $Q_1$, (b) $Q_3$, and (c) IQR.[^37]

### Robust statistics

How are the of the data set affected by the observation, 64,401? What
would have happened if this email wasn’t observed? What would happen to
these if the observation at 64,401 had been even larger, say 150,000?
These scenarios are plotted alongside the original data in
Figure [email50NumCharDotPlotRobustEx], and sample statistics are
computed under each scenario in Table [robustOrNotTable].

![Dot plots of the original character count data and two modified data
sets.](01/figures/email50NumCharDotPlotRobustEx/email50NumCharDotPlotRobustEx)

[email50NumCharDotPlotRobustEx]

<span>l c cc c cc</span> &

& &

&\
scenario && median & IQR && $\bar{x}$ & $s$\
original data && 6,890 & 12,875 && 11,600 & 13,130\
drop 66,924 observation && 6,768 & 11,702 && 10,521 & 10,798\
move 66,924 to 150,000 && 6,890 & 12,875 && 13,310 & 22,434\

[robustOrNotTable]

[numCharWhichIsMoreRobust] (a) Which is more affected by extreme
observations, the mean or median? Table [robustOrNotTable] may be
helpful. (b) Is the standard deviation or IQR more affected by extreme
observations?[^38]

The median and IQR are called because extreme observations have little
effect on their values. The mean and standard deviation are much more
affected by changes in extreme observations.

<span>The median and IQR do not change much under the three scenarios in
Table [robustOrNotTable]. Why might this be the case?</span> The median
and IQR are only sensitive to numbers near $Q_1$, the median, and $Q_3$.
Since values in these regions are relatively stable – there aren’t large
jumps between observations – the median and IQR estimates are also quite
stable.

The distribution of vehicle prices tends to be right skewed, with a few
luxury and sports cars lingering out into the right tail. If you were
searching for a new car and cared about price, should you be more
interested in the mean or median price of vehicles sold, assuming you
are in the market for a regular car?[^39]

### Transforming data (special topic) {#transformingDataSubsection}

When data are very strongly skewed, we sometimes transform them so they
are easier to model. Consider the histogram of salaries for Major League
Baseball players’ salaries from 2010, which is shown in
Figure [histMLBSalariesReg].

[histMLBSalaries]

<span>The histogram of MLB player salaries is useful in that we can see
the data are extremely skewed and centered (as gauged by the median) at
about \$1 million. What isn’t useful about this plot?</span> Most of the
data are collected into one bin in the histogram and the data are so
strongly skewed that many details in the data are obscured.

There are some standard transformations that are often applied when much
of the data cluster near zero (relative to the larger values in the data
set) and all observations are positive. A is a rescaling of the data
using a function. For instance, a plot of the natural logarithm[^40] of
player salaries results in a new histogram in
Figure [histMLBSalariesLog]. Transformed data are sometimes easier to
work with when applying statistical models because the transformed data
are much less skewed and outliers are usually less extreme.

Transformations can also be applied to one or both variables in a
scatterplot. A scatterplot of the and variables is shown in
Figure [email50LinesCharactersMod], which was earlier shown in
Figure [email50LinesCharacters]. We can see a positive association
between the variables and that many observations are clustered near
zero. In Chapter [linRegrForTwoVar], we might want to use a straight
line to model the data. However, we’ll find that the data in their
current state cannot be modeled very well.
Figure [email50LinesCharactersModLog] shows a scatterplot where both the
and variables have been transformed using a log (base $e$)
transformation. While there is a positive association in each plot, the
transformed data show a steadier trend, which is easier to model than
the untransformed data.

[email50LinesCharactersModMain]

Transformations other than the logarithm can be useful, too. For
instance, the square root ($\sqrt{\text{original observation}}$) and
inverse ($\frac{1}{\text{original observation}}$) are used by
statisticians. Common goals in transforming data are to see the data
structure differently, reduce skew, assist in modeling, or straighten a
nonlinear relationship in a scatterplot.

### Mapping data (special topic)

The data set offers many numerical variables that we could plot using
dot plots, scatterplots, or box plots, but these miss the true nature of
the data. Rather, when we encounter geographic data, we should map it
using an , where colors are used to show higher and lower values of a
variable. Figures [countyIntensityMaps1] and [countyIntensityMaps2]
shows intensity maps for federal spending per capita (), poverty rate in
percent (), homeownership rate in percent (), and median household
income (). The color key indicates which colors correspond to which
values. Note that the intensity maps are not generally very helpful for
getting precise values in any given county, but they are very helpful
for seeing geographic trends and generating interesting research
questions.

[countyIntensityMaps1]

[countyIntensityMaps2]

<span>What interesting features are evident in the and intensity
maps?</span> The federal spending intensity map shows substantial
spending in the Dakotas and along the central-to-western part of the
Canadian border, which may be related to the oil boom in this region.
There are several other patches of federal spending, such as a vertical
strip in eastern Utah and Arizona and the area where Colorado, Nebraska,
and Kansas meet. There are also seemingly random counties with very high
federal spending relative to their neighbors. If we did not cap the
federal spending range at \$18 per capita, we would actually find that
some counties have extremely high federal spending while there is almost
no federal spending in the neighboring counties. These high-spending
counties might contain military bases, companies with large government
contracts, or other government facilities with many employees.

Poverty rates are evidently higher in a few locations. Notably, the deep
south shows higher poverty rates, as does the southwest border of Texas.
The vertical strip of eastern Utah and Arizona, noted above for its
higher federal spending, also appears to have higher rates of poverty
(though generally little correspondence is seen between the two
variables). High poverty rates are evident in the Mississippi flood
plains a little north of New Orleans and also in a large section of
Kentucky and West Virginia.

What interesting features are evident in the intensity map?[^41]

## Considering categorical data {#categoricalData}

Like numerical data, categorical data can also be organized and
analyzed. This section introduces tables and other basic tools for
categorical data that are used throughout this book. The data set
represents a sample from a larger email data set called . This larger
data set contains information on 3,921 emails. In this section we will
examine whether the presence of numbers, small or large, in an email
provides any useful value in classifying email as spam or not spam.

### Contingency tables and bar plots

Table [emailSpamNumberTableTotals] summarizes two variables: and .
Recall that is a categorical variable that describes whether an email
contains no numbers, only small numbers (values under 1 million), or at
least one big number (a value of 1 million or more). A table that
summarizes data for two categorical variables in this way is called a .
Each value in the table represents the number of times a particular
combination of variable outcomes occurred. For example, the value 149
corresponds to the number of emails in the data set that are spam *and*
had no number listed in the email. Row and column totals are also
included. The provide the total counts across each row (e.g.
$149 + 168 + 50 = 367$), and are total counts down each column.

A table for a single variable is called a . Table [emailNumberTable] is
a frequency table for the variable. If we replaced the counts with
percentages or proportions, the table would be called a .

<span>ll ccc rr</span> & & &\
 & & none & small & big & Total &

 \
 & spam & 149 & 168 & 50 & 367\
[0pt] & not spam & 400 & 2659 & 495 & 3554\
 & Total & 549 & 2827 & 545 & 3921\

[emailSpamNumberTableTotals]

  ------ ------- ----- -------
   none   small   big   Total
   549    2827    545   3921
  ------ ------- ----- -------

  : A frequency table for the variable.

[emailNumberTable]

A bar plot is a common way to display a single categorical variable. The
left panel of Figure [emailNumberBarPlot] shows a for the variable. In
the right panel, the counts are converted into proportions (e.g.
$549/3921=0.140$ for ).

![Two bar plots of . The left panel shows the counts, and the right
panel shows the proportions in each
group.](01/figures/emailNumberBarPlot/emailNumberBarPlot)

[emailNumberBarPlot]

### Row and column proportions

Table [rowPropSpamNumber] shows the row proportions for
Table [emailSpamNumberTableTotals]. The are computed as the counts
divided by their row totals. The value 149 at the intersection of and is
replaced by $149/367=0.406$, i.e. 149 divided by its row total, 367. So
what does 0.406 represent? It corresponds to the proportion of spam
emails in the sample that do not have any numbers.

                             none                 small                  big   Total
  ---------- -------------------- --------------------- -------------------- -------
  spam          $149/367 = 0.406$     $168/367 = 0.458$     $50/367 = 0.136$   1.000
  not spam     $400/3554 = 0.113$   $2657/3554 = 0.748$   $495/3554 = 0.139$   1.000
  Total        $549/3921 = 0.140$   $2827/3921 = 0.721$   $545/3921 = 0.139$   1.000

  : A contingency table with row proportions for the and variables.

[rowPropSpamNumber]

A contingency table of the column proportions is computed in a similar
way, where each is computed as the count divided by the corresponding
column total. Table [colPropSpamNumber] shows such a table, and here the
value 0.271 indicates that 27.1% of emails with no numbers were spam.
This rate of spam is much higher than emails with only small numbers
(5.9%) or big numbers (9.2%). Because these spam rates vary between the
three levels of (, , ), this provides evidence that the and variables
are associated.

                            none                 small                 big                 Total
  ---------- ------------------- --------------------- ------------------- ---------------------
  spam         $149/549 = 0.271$    $168/2827 = 0.059$    $50/545 = 0.092$    $367/3921 = 0.094$
  not spam     $400/549 = 0.729$   $2659/2827 = 0.941$   $495/545 = 0.908$   $3684/3921 = 0.906$
  Total                    1.000                 1.000               1.000                 1.000

  : A contingency table with column proportions for the and variables.

[colPropSpamNumber]

We could also have checked for an association between and in
Table [rowPropSpamNumber] using row proportions. When comparing these
row proportions, we would look down columns to see if the fraction of
emails with no numbers, small numbers, and big numbers varied from to .

What does 0.458 represent in Table [rowPropSpamNumber]? What does 0.059
represent in Table [colPropSpamNumber]?[^42]

What does 0.139 at the intersection of and represent in
Table [rowPropSpamNumber]? What does 0.908 represent in the
Table [colPropSpamNumber]?[^43]

<span>Data scientists use statistics to filter spam from incoming email
messages. By noting specific characteristics of an email, a data
scientist may be able to classify some emails as spam or not spam with
high accuracy. One of those characteristics is whether the email
contains no numbers, small numbers, or big numbers. Another
characteristic is whether or not an email has any HTML content. A
contingency table for the and variables from the data set are shown in
Table [emailSpamHTMLTableTotals]. Recall that an HTML email is an email
with the capacity for special formatting, e.g. bold text. In
Table [emailSpamHTMLTableTotals], which would be more helpful to someone
hoping to classify email as spam or regular email: row or column
proportions?</span> [weighingRowColumnProportions] Such a person would
be interested in how the proportion of spam changes within each email
format. This corresponds to column proportions: the proportion of spam
in plain text emails and the proportion of spam in HTML emails.

If we generate the column proportions, we can see that a higher fraction
of plain text emails are spam ($209/1195 = 17.5\%$) than compared to
HTML emails ($158/2726 = 5.8\%$). This information on its own is
insufficient to classify an email as spam or not spam, as over 80% of
plain text emails are not spam. Yet, when we carefully combine this
information with many other characteristics, such as and other
variables, we stand a reasonable chance of being able to classify some
email as spam or not spam.

              text   HTML    Total
  ---------- ------ ------ -------
  spam        209    158       367
  not spam    986    2568     3554
  Total       1195   2726     3921

  : A contingency table for and .

[emailSpamHTMLTableTotals]

Example [weighingRowColumnProportions] points out that row and column
proportions are not equivalent. Before settling on one form for a table,
it is important to consider each to ensure that the most useful table is
constructed.

Look back to Tables [rowPropSpamNumber] and [colPropSpamNumber]. Which
would be more useful to someone hoping to identify spam emails using the
variable?[^44]

### Segmented bar and mosaic plots {#segmentedBarPlotsAndIndependence}

Contingency tables using row or column proportions are especially useful
for examining how two categorical variables are related. Segmented bar
and mosaic plots provide a way to visualize the information in these
tables.

A is a graphical display of contingency table information. For example,
a segmented bar plot representing Table [colPropSpamNumber] is shown in
Figure [emailSpamNumberSegBar], where we have first created a bar plot
using the variable and then separated each group by the levels of . The
column proportions of Table [colPropSpamNumber] have been translated
into a standardized segmented bar plot in
Figure [emailSpamNumberSegBarSta], which is a helpful visualization of
the fraction of spam emails in each level of .

[emailSpamNumberSegBarPlot]

<span>Examine both of the segmented bar plots. Which is more
useful?</span> Figure [emailSpamNumberSegBar] contains more information,
but Figure [emailSpamNumberSegBarSta] presents the information more
clearly. This second plot makes it clear that emails with no number have
a relatively high rate of spam email – about 27%! On the other hand,
less than 10% of email with small or big numbers are spam.

Since the proportion of spam changes across the groups in
Figure [emailSpamNumberSegBarSta], we can conclude the variables are
dependent, which is something we were also able to discern using table
proportions. Because both the and groups have relatively few
observations compared to the group, the association is more difficult to
see in Figure [emailSpamNumberSegBar].

In some other cases, a segmented bar plot that is not standardized will
be more useful in communicating important information. Before settling
on a particular segmented bar plot, create standardized and
non-standardized forms and decide which is more effective at
communicating features of the data.

[emailSpamNumberMosaicPlot]

A is a graphical display of contingency table information that is
similar to a bar plot for one variable or a segmented bar plot when
using two variables. Figure [emailNumberMosaic] shows a mosaic plot for
the variable. Each column represents a level of , and the column widths
correspond to the proportion of emails of each number type. For
instance, there are fewer emails with no numbers than emails with only
small numbers, so the no number email column is slimmer. In general,
mosaic plots use box *areas* to represent the number of observations.

![Mosaic plot where emails are grouped by the variable after they’ve
been divided into and
.](01/figures/emailSpamNumberMosaicPlot/emailSpamNumberMosaicRev)

[emailSpamNumberMosaicRev]

This one-variable mosaic plot is further divided into pieces in
Figure [emailSpamNumberMosaic] using the variable. Each column is split
proportionally according to the fraction of emails that were spam in
each number category. For example, the second column, representing
emails with only small numbers, was divided into emails that were spam
(lower) and not spam (upper). As another example, the bottom of the
third column represents spam emails that had big numbers, and the upper
part of the third column represents regular emails that had big numbers.
We can again use this plot to see that the and variables are associated
since some columns are divided in different vertical locations than
others, which was the same technique used for checking an association in
the standardized version of the segmented bar plot.

In a similar way, a mosaic plot representing row proportions of
Table [emailSpamNumberTableTotals] could be constructed, as shown in
Figure [emailSpamNumberMosaicRev]. However, because it is more
insightful for this application to consider the fraction of spam in each
category of the variable, we prefer Figure [emailSpamNumberMosaic].

### The only pie chart you will see in this book

While pie charts are well known, they are not typically as useful as
other charts in a data analysis. A is shown in Figure  alongside a bar
plot. It is generally more difficult to compare group sizes in a pie
chart than in a bar plot, especially when categories have nearly
identical counts or proportions. In the case of the and categories, the
difference is so slight you may be unable to distinguish any difference
in group sizes for either plot!

![A pie chart and bar plot of for the data
set.](01/figures/emailNumberPieChart/emailNumberPieChart)

[emailNumberPieChart]

### Comparing numerical data across groups {#comparingAcrossGroups}

Some of the more interesting investigations can be considered by
examining numerical data across groups. The methods required here aren’t
really new. All that is required is to make a numerical plot for each
group. Here two convenient methods are introduced: side-by-side box
plots and hollow histograms.

We will take a look again at the data set and compare the median
household income for counties that gained population from 2000 to 2010
versus counties that had no gain. While we might like to make a causal
connection here, remember that these are observational data and so such
an interpretation would be unjustified.

There were 2,041 counties where the population increased from 2000 to
2010, and there were 1,099 counties with no gain (all but one were a
loss). A random sample of 100 counties from the first group and 50 from
the second group are shown in Table [countyIncomeSplitByPopGainTable] to
give a better sense of some of the raw data.

<span> ccc ccc c ccc </span> &&\
 41.2 & 33.1 & 30.4 & 37.3 & 79.1 & 34.5 &

 & 40.3 & 33.5 & 34.8\
22.9 & 39.9 & 31.4 & 45.1 & 50.6 & 59.4 && 29.5 & 31.8 & 41.3\
47.9 & 36.4 & 42.2 & 43.2 & 31.8 & 36.9 && 28 & 39.1 & 42.8\
50.1 & 27.3 & 37.5 & 53.5 & 26.1 & 57.2 && 38.1 & 39.5 & 22.3\
57.4 & 42.6 & 40.6 & 48.8 & 28.1 & 29.4 && 43.3 & 37.5 & 47.1\
43.8 & 26 & 33.8 & 35.7 & 38.5 & 42.3 && 43.7 & 36.7 & 36\
41.3 & 40.5 & 68.3 & 31 & 46.7 & 30.5 && 35.8 & 38.7 & 39.8\
68.3 & 48.3 & 38.7 & 62 & 37.6 & 32.2 && 46 & 42.3 & 48.2\
42.6 & 53.6 & 50.7 & 35.1 & 30.6 & 56.8 && 38.6 & 31.9 & 31.1\
66.4 & 41.4 & 34.3 & 38.9 & 37.3 & 41.7 && 37.6 & 29.3 & 30.1\
51.9 & 83.3 & 46.3 & 48.4 & 40.8 & 42.6 && 57.5 & 32.6 & 31.1\
44.5 & 34 & 48.7 & 45.2 & 34.7 & 32.2 && 46.2 & 26.5 & 40.1\
39.4 & 38.6 & 40 & 57.3 & 45.2 & 33.1 && 38.4 & 46.7 & 25.9\
43.8 & 71.7 & 45.1 & 32.2 & 63.3 & 54.7 && 36.4 & 41.5 & 45.7\
71.3 & 36.3 & 36.4 & 41 & 37 & 66.7 && 39.7 & 37 & 37.7\
50.2 & 45.8 & 45.7 & 60.2 & 53.1 & && 21.4 & 29.3 & 50.1\
35.8 & 40.4 & 51.5 & 66.4 & 36.1 & && 43.6 & 39.8 &\

[countyIncomeSplitByPopGainTable]

The is a traditional tool for comparing across groups. An example is
shown in the left panel of Figure [countyIncomeSplitByPopGain], where
there are two box plots, one for each group, placed into one plotting
window and drawn on the same scale.

![Side-by-side box plot (left panel) and hollow histograms (right panel)
for , where the counties are split by whether there was a population
gain or loss from 2000 to 2010. The income data were collected between
2006 and
2010.](01/figures/countyIncomeSplitByPopGain/countyIncomeSplitByPopGain)

[countyIncomeSplitByPopGain]

Another useful plotting method uses to compare numerical data across
groups. These are just the outlines of histograms of each group put on
the same plot, as shown in the right panel of
Figure [countyIncomeSplitByPopGain].

[comparingPriceByTypeExercise] Use the plots in
Figure [countyIncomeSplitByPopGain] to compare the incomes for counties
across the two groups. What do you notice about the approximate center
of each group? What do you notice about the variability between groups?
Is the shape relatively consistent between groups? How many *prominent*
modes are there for each group?[^45]

What components of each plot in Figure [countyIncomeSplitByPopGain] do
you find most useful?[^46]

[^1]: Chimowitz MI, Lynn MJ, Derdeyn CP, et al. 2011. Stenting versus
    Aggressive Medical Therapy for Intracranial Arterial Stenosis. New
    England Journal of Medicine 365:993-1003. . NY Times article
    reporting on the study: .

[^2]: The proportion of the 224 patients who had a stroke within 365
    days: $45/224 = 0.20$.

[^3]: Formally, a summary statistic is a value computed from the data.
    Some summary statistics are more useful than others.

[^4]: A case is also sometimes called a or an .

[^5]: Each county may be viewed as a case, and there are eleven pieces
    of information recorded for each case. A table with 3,143 rows and
    11 columns could hold these data, where each row represents a county
    and each column represents a particular piece of information.

[^6]: 

[^7]: Sometimes also called a variable.

[^8]: There are only two possible values for each variable, and in both
    cases they describe categories. Thus, each is a categorical
    variable.

[^9]: Two sample questions: (1) Intuition suggests that if there are
    many line breaks in an email then there would also tend to be many
    characters: does this hold true? (2) Is there a connection between
    whether an email format is plain text (versus HTML) and whether it
    is a spam message?

[^10]: ([timeToGraduationQuestionForUCLAStudents]) Notice that the first
    question is only relevant to students who complete their degree; the
    average cannot be computed using a student who never finished her
    degree. Thus, only Duke undergraduate students who have graduated in
    the last five years represent cases in the population under
    consideration. Each such student would represent an individual case.
    ([identifyPopulationOfStentStudy]) A person with severe heart
    disease represents a case. The population includes all people with
    severe heart disease.

[^11]: Answers will vary. From our own anecdotal experiences, we believe
    people tend to rant more about products that fell below expectations
    than rave about those that perform as expected. For this reason, we
    suspect there is a negative bias in product ratings on sites like
    Amazon. However, since our experiences may not be representative, we
    also keep an open mind.

[^12]: Sometimes the explanatory variable is called the variable and the
    response variable is called the variable. However, this becomes
    confusing since a *pair* of variables might be independent or
    dependent, so we avoid this language.

[^13]: No. See the paragraph following the exercise for an explanation.

[^14]: Also called a , , or a .

[^15]: Answers will vary. Population density may be important. If a
    county is very dense, then a larger fraction of residents may live
    in multi-unit structures. Additionally, the high density may
    contribute to increases in property value, making homeownership
    infeasible for many residents.

[^16]: 

[^17]: Anturane Reinfarction Trial Research Group. 1980. Sulfinpyrazone
    in the prevention of sudden death after myocardial infarction. New
    England Journal of Medicine 302(5):250-256.

[^18]: Human subjects are often called , , or .

[^19]: There are always some researchers in the study who do know which
    patients are receiving which treatment. However, they do not
    interact with the study’s patients and do not tell the blinded
    health care professionals who is receiving which treatment.

[^20]: The researchers assigned the patients into their treatment
    groups, so this study was an experiment. However, the patients could
    distinguish what treatment they received, so this study was not
    blind. The study could not be double-blind since it was not blind.

[^21]: Answers may vary. Scatterplots are helpful in quickly spotting
    associations between variables, whether those associations represent
    simple or more complex relationships.

[^22]: Subset of data from

[^23]: Consider the case where your vertical axis represents something
    “good” and your horizontal axis represents something that is only
    good in moderation. Health and water consumption fit this
    description since water becomes toxic when consumed in excessive
    quantities.

[^24]: $x_1$ corresponds to the number of characters in the first email
    in the sample (21.7, in thousands), $x_2$ to the number of
    characters in the second email (7.0, in thousands), and $x_i$
    corresponds to the number of characters in the $i^{th}$ email in the
    data set.

[^25]: The sample size was $n=50$.

[^26]: Other ways to describe data that are skewed to the right: , , or
    .

[^27]: The skew is visible in all three plots, though the flat dot plot
    is the least useful. The stacked dot plot and histogram are helpful
    visualizations for identifying skew.

[^28]: Character counts for individual emails.

[^29]: Another definition of mode, which is not typically used in
    statistics, is the value with the most occurrences. It is common to
    have *no* observations with the same value in a data set, which
    makes this other definition useless for many real data sets.

[^30]: Unimodal. Remember that *uni* stands for 1 (think *uni*cycles).
    Similarly, *bi* stands for 2 (think *bi*cycles). (We’re hoping a
    *multicycle* will be invented to complete this analogy.)

[^31]: There might be two height groups visible in the data set: one of
    the students and one of the adults. That is, the data are probably
    bimodal.

[^32]: The only difference is that the population variance has a
    division by $n$ instead of $n-1$.

[^33]: Figure [severalDiffDistWithSdOf1] shows three distributions that
    look quite different, but all have the same mean, variance, and
    standard deviation. Using modality, we can distinguish between the
    first plot (bimodal) and the last two (unimodal). Using skewness, we
    can distinguish between the last plot (right skewed) and the first
    two. While a picture, like a histogram, tells a more complete story,
    we can use modality and shape (symmetry/skew) to characterize basic
    information about a distribution.

[^34]: Since $Q_1$ and $Q_3$ capture the middle 50% of the data and the
    median splits the data in the middle, 25% of the data fall between
    $Q_1$ and the median, and another 25% falls between the median and
    $Q_3$.

[^35]: While the choice of exactly 1.5 is arbitrary, it is the most
    commonly used value for box plots.

[^36]: That occasionally there may be very long emails.

[^37]: These visual estimates will vary a little from one person to the
    next: $Q_1\approx$ 3,000, $Q_3\approx$ 15,000,
    $\text{IQR}=Q_3 - Q_1 \approx $ 12,000. (The true values: $Q_1=$
    2,536, $Q_3=$ 15,411, $\text{IQR} = $ 12,875.)

[^38]: \(a) Mean is affected more. (b) Standard deviation is affected more.
    Complete explanations are provided in the material following Guided
    Practice [numCharWhichIsMoreRobust].

[^39]: Buyers of a “regular car” should be concerned about the median
    price. High-end car sales can drastically inflate the mean price
    while the median will be more robust to the influence of those
    sales.

[^40]: Statisticians often write the natural logarithm as $\log$. You
    might be more familiar with it being written as $\ln$.

[^41]: Note: answers will vary. There is a very strong correspondence
    between high earning and metropolitan areas. You might look for
    large cities you are familiar with and try to spot them on the map
    as dark spots.

[^42]: 0.458 represents the proportion of spam emails that had a small
    number. 0.058 represents the fraction of emails with small numbers
    that are spam.

[^43]: 0.139 represents the fraction of non-spam email that had a big
    number. 0.908 represents the fraction of emails with big numbers
    that are non-spam emails.

[^44]: The column proportions in Table [colPropSpamNumber] will probably
    be most useful, which makes it easier to see that emails with small
    numbers are spam about 5.9% of the time (relatively rare). We would
    also see that about 27.1% of emails with no numbers are spam, and
    9.2% of emails with big numbers are spam.

[^45]: Answers may vary a little. The counties with population gains
    tend to have higher income (median of about \$45,000) versus
    counties without a gain (median of about \$40,000). The variability
    is also slightly larger for the population gain group. This is
    evident in the IQR, which is about 50% bigger in the *gain* group.
    Both distributions show slight to moderate right skew and are
    unimodal. There is a secondary small bump at about \$60,000 for the
    *no gain* group, visible in the hollow histogram plot, that seems
    out of place. (Looking into the data set, we would find that 8 of
    these 15 counties are in Alaska and Texas.) The box plots indicate
    there are many observations far above the median in each group,
    though we should anticipate that many observations will fall beyond
    the whiskers when using such a large data set.

[^46]: Answers will vary. The side-by-side box plots are especially
    useful for comparing centers and spreads, while the hollow
    histograms are more useful for seeing distribution shape, skew, and
    groups of anomalies.
