package babystep.api.service

import babystep.api.model.*
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

    fun applyStatusChange(params: ApplyJobParams){
        // 求人応募されていたら、応募キャンセルに変更
        val checkResult = repository.jobApplyStatusCheck(params)
        if (checkResult.isNotEmpty()) {
            println("cancel")
            repository.cancelAppliedJob(params)
        // 求人応募されていなかったら、応募する
        } else if (checkResult.isEmpty()) {
            println("apply")
            repository.applyJob(params)
        }
    }
}