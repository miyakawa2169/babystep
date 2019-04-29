package babystep.api.controller

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/worker")
class WorkerRestController {

    @GetMapping("/jobs")
    fun findJobs(){
        println("hello world")
    }

    data class findJobsRequest(
            val workerId: Long,
            val searchWord: String? = null,
            val jobCategoryId: Long? = null,
            val tagIds: List<Long>? = null
    )

}