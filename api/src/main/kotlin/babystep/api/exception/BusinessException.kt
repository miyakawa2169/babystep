package babystep.api.exception

import org.springframework.http.HttpStatus
import org.springframework.web.bind.annotation.ResponseStatus
import java.lang.RuntimeException

abstract class BusinessException(
        private val form: Map<String, Any> = emptyMap(),
        private val reason: String? = null,

        message: String = "",
        cause: Throwable? = null
) : RuntimeException(message, cause) {
    val body
        get(): Map<String, Any> {
            return mapOf(Pair("form", this.form), Pair("id", this.javaClass.simpleName)).let {
                if (this.reason != null
                ) {
                    mapOf(Pair("reason", this.reason)) + it
                } else {
                    it
                }
            }
        }
}

@ResponseStatus(value = HttpStatus.BAD_REQUEST)
class ValidationException(form: Map<String, Any> = emptyMap(), reason: String? = null) :
        BusinessException(form = form, reason = reason) {
    companion object {
        fun required(): String = "必須入力です"
        fun default(): String = "不正な値です"
    }
}