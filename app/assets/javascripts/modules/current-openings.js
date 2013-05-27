$(document).ready(function(){
  // var sillyYqlUrl = "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20xml%20where%20url%3D'http%3A%2F%2Fwww.jobvite.com%2FCompanyJobs%2FXml.aspx%3Fc%3Dq0g9Vfw4'&format=json";

  if($('#body.careers').length > 0){
    $.getJSON('/jobs', function(data) {
        var jobEntries = data.query.results.result.job;
        var jobCategories = {};

        for (var i = 0; i < jobEntries.length; i++) {
          var job = jobEntries[i];
          if (jobCategories[job.category] === undefined) {
            jobCategories[job.category] = [];
          }
          jobCategories[job.category].push(job);
        }

        for (var j in jobCategories) {
          var group = $("<div class='current-openings-group'>");
          var groupTitle = $("<div class='current-openings-title'>").text(j);
          $(group).append(groupTitle);
          for (var k = 0; k < jobCategories[j].length; k++) {
            var jobInfo = jobCategories[j][k]
            var jobContainer = $("<div class='current-openings-job'>");

            var jobHeader = $("<div class='job-header'>");
            var jobIcon = $("<div class='job-icon'>");
            var jobTitle = $("<div class='job-title'>").text(jobInfo.title);
            var jobLocation = $("<div class='job-location'>").text(jobInfo.location);
            $(jobHeader).append(jobIcon).append(jobTitle).append(jobLocation);
            $(jobContainer).append(jobHeader);

            var jobDetails = $("<div class='job-details'>");
            var jobPostedDate = $("<div class='job-date'>").html("<strong>Posted on:</strong> " + jobInfo.date);
            var jobDescription = $("<div class='job-description'>").html(jobInfo.description);
            var jobLinkContainer = $("<div class='job-link-container'>");
            var jobLink = $("<input class='job-apply button' type='button' value='Apply'>").data({url: jobInfo["apply-url"]});
            $(jobLinkContainer).append(jobLink)
            $(jobDetails).append(jobPostedDate).append(jobDescription).append(jobLinkContainer);

            $(jobContainer).append(jobDetails);
            $(group).append(jobContainer);
          }
          $(".careers-current-openings").append(group);
        }

        $(".careers-current-openings .job-details").hide();
        $(".careers-current-openings-loading").hide();
        $(".careers-current-openings").show();

        $(".job-header").on("click", function(){
          $(this).toggleClass("active").siblings(".job-details").slideToggle(300);
        });

        $(".job-apply").on("click", function(){
          window.open($(this).data("url"), '_blank');
          return false;
        });

      }
    );
  }
});
