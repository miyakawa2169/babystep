package babystep.api.controller

import babystep.api.model.FindJobsSearchCondition
import babystep.api.model.FindJobsSearchResult
import babystep.api.model.GetJobDetailSearchCondition
import babystep.api.model.GetJobDetailSearchResult
import babystep.api.service.WorkerService
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/worker")
class WorkerRestController(
        private val service: WorkerService
) {

    @GetMapping("/jobs")
    fun findJobs(
            @RequestParam(name = "workerId", required = true) workerId: Long,
            @RequestParam(name = "searchWord", required = false) searchWord: String? = null,
            @RequestParam(name = "jobCategoryId", required = false) jobCategoryId: Long? = null,
            @RequestParam(name = "tagIds", required = false) tagIds: List<Long>? = null
            ): List<FindJobsSearchResult> {
        val condition = FindJobsSearchCondition(
                workerId = workerId,
                searchWord = searchWord,
                jobCategoryId = jobCategoryId,
                tagIds = tagIds
        )
        return service.findJobs(condition)
    }

    @GetMapping("/jobs/{jobId}")
    fun getJobDetail(
            @RequestParam(name = "workerId", required = true) workerId: Long,
            @PathVariable("jobId") jobId: Long
    ): GetJobDetailSearchResult {
        val condition = GetJobDetailSearchCondition(
                workerId = workerId,
                jobId = jobId
        )
        return service.getJobDetail(condition)
    }

}