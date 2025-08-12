;; Simple DeFi Staking Contract
;; Stake fungible tokens and claim basic fixed rewards

;; Define the staking token (can be any fungible token)
(define-fungible-token stake-token)

;; Constants
(define-constant err-invalid-amount (err u100))
(define-constant err-insufficient-balance (err u101))
(define-constant err-no-stake (err u102))

;; Data maps
(define-map stakes principal uint) ;; amount staked by each user
(define-data-var total-staked uint u0)

;; Function 1: Stake tokens
(define-public (stake (amount uint))
  (begin
    (asserts! (> amount u0) err-invalid-amount)
    (asserts! (>= (ft-get-balance stake-token tx-sender) amount) err-insufficient-balance)
    ;; Transfer tokens to contract
    (try! (ft-transfer? stake-token amount tx-sender (as-contract tx-sender)))
    ;; Update stake
    (map-set stakes tx-sender (+ (default-to u0 (map-get? stakes tx-sender)) amount))
    (var-set total-staked (+ (var-get total-staked) amount))
    (ok true)
  )
)

;; Function 2: Claim rewards
;; Reward = 10% of staked amount
(define-public (claim-reward)
  (let ((staked (default-to u0 (map-get? stakes tx-sender))))
    (asserts! (> staked u0) err-no-stake)
    (let ((reward (/ staked u10)))
      (try! (ft-mint? stake-token reward tx-sender))
      (ok {staked: staked, reward: reward})
    )
  )
)