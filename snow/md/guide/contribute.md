[![Logo]({{{rel_path}}}images/logo.png)]({{{rel_path}}}index.html#guide)

---

##Contributing

###Things you can do

As snow is a community project, it is imperative that the community take part as it increases the value, reliability, and longevity of the project.   

The following is a list of things that are important :

- finding bugs
- testing on various platforms
- writing ground truth tests
- writing tutorials/guides
- adding backends (audio, render)
- porting to new platforms

---


<a name="tests"><a href="#tests"><h3>Contributing tests</h3></a></a>

#### How snow is tested

Testing in snow is a flexible and open endeavour.   
Testing often serves different purposes in different ways,   
some tests are automated, some are not. Some are interactive, some are not.

The general consensus here is that everything should have a ground truth available to test against.   
Automated tests run in their natural habitat, not in isolation, where possible. 
For this reason the tests are written using snow itself, as the best place to test snow application code, is in a snow application.

**There are no TDD zealots living in these parts**, and no homes for zealots available.   
However, there is a desire to provide battle tested, provable code.

Inside the `tests` folder contains the following structure.

**features/**   
  - Contains demos and tests that help debug framework features.   
    If a bug is reported, it is often tested against these feature tests as a baseline.   

**unit/**   
  - Automated code based validation covering critical systems where applicable.    

**utils/**   
  - Tests that cover things in the framework that don't fit elsewhere   

**wip/**   
  - This folder is basically a test bed for developing code that might be promoted to _features_ later. 
    These may or may not work, and should always be maintained against the current version or repo. Legacy tests are not kept in the repo.   

####How to submit a new test

Commit or submit a pull request for the test into the wip folder.   
This allows the community and others in the situation/feature/test to weigh in on the matter, 
and allows code review/accountability to be handled gracefully,   
without losing access the valuable contribution for users or developers alike.

Once everyone involved is happy, the test will be promoted to the correct folder. 

####Appending or patching an existing test

Commit or submit a pull request for the patch as normal, and discussions can be opened either in the issue list or on the comment thread of that commit (preferably in the issue list as it is more visible).

---

<a name="guides"><a href="#guides"><h3>Contributing guides</h3></a></a>

####How to submit a guide

**Submit a pull request** for the markdown file, following the structure in [the existing guides](https://github.com/underscorediscovery/snow/tree/docs-src/snow/md/guide), and **open an issue** tagged guide to discuss the guide if you are looking for feedback.

---

<a name="code"><a href="#code"><h3>Contributing code</h3></a></a>

Read the code [convention/design]({{{rel_path}}}guide/code.html) document.   
Submit a pull request or commit.   
Open an issue to discuss the contribution, if you want feedback.


---

##Back

[To the guide]({{{rel_path}}}index.html#guide)

<br/><br/><br/>
<br/><br/><br/>