package babystep.api.controller

import babystep.api.model.FindJobsSearchCondition
import babystep.api.model.FindJobsSearchResult
import babystep.api.service.WorkerService
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

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

}