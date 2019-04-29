package babystep.api

import org.mybatis.spring.annotation.MapperScan
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@MapperScan(basePackages = ["babystep.api.repository"])
@SpringBootApplication
class ApiApplication

fun main(args: Array<String>) {
	runApplication<ApiApplication>(*args)
}
