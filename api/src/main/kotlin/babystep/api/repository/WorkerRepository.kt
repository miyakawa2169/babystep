package babystep.api.repository

import babystep.api.model.FindJobsSearchCondition
import babystep.api.model.FindJobsSearchResult
import org.springframework.stereotype.Repository

@Repository
interface WorkerRepository {

    fun findJobs(condition: FindJobsSearchCondition): List<FindJobsSearchResult>

}