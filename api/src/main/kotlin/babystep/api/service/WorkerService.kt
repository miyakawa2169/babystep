package babystep.api.service

import babystep.api.model.FindJobsSearchCondition
import babystep.api.model.FindJobsSearchResult
import babystep.api.model.GetJobDetailSearchCondition
import babystep.api.model.GetJobDetailSearchResult
import babystep.api.repository.WorkerRepository
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
@Transactional(rollbackFor = [Throwable::class])
class WorkerService(
        private val repository: WorkerRepository
) {

    fun findJobs(condition: FindJobsSearchCondition): List<FindJobsSearchResult> {
        return repository.findJobs(condition)
    }

    fun getJobDetail(condition: GetJobDetailSearchCondition): GetJobDetailSearchResult {
        return repository.getJobDetail(condition)
    }

}