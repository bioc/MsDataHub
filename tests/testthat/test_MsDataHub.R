test_that("MsDataHub() works", {
    expect_s3_class(MsDataHub(), "data.frame")
})


test_that("MsDataHub data", {
    ttls <- MsDataHub()[[1]]
    ## Failing because they are on MassIVE
    ttls <- setdiff(ttls, grep("Ai2025", ttls, value = TRUE))
    ttls <- setdiff(ttls, grep("D19_15um30cm_SC1.mzML", ttls, value = TRUE))
    ttls <- setdiff(ttls, grep("OR11_20160122_PG_HeLa_CVB3_CT_A.mzML", ttls, value = TRUE))
    for (ttl in ttls) {
        message("*** Getting ", ttl)
        x <- eval(call(ttl))
        val <- validObject(x)
        if (!val) message(ttl, " NOT VALID")
        expect_true(val)
    }
})
