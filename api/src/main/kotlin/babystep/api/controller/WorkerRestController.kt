package babystep.api.controller

import babystep.api.model.*
import babystep.api.service.WorkerService
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/worker")
class WorkerRestController(
        private val service: WorkerService
) {

    // 求人一覧取得API
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

    // 求人詳細取得API
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

    // 求人応募更新API
    @PatchMapping("/jobs/applyStatusChange")
    fun applyStatusChange(
            @RequestParam(name = "workerId", required = true) workerId: Long,
            @RequestParam(name = "jobId", required = true) jobId: Long //TODO requestBody変更
    ){
        val param = ApplyJobParams(
                workerId = workerId,
                jobId = jobId
        )
        service.applyStatusChange(param)
    }

//    data class applyStatusChangeRequest(
//            val jobId: Long
//    )
}